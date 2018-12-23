class ShortenedUrl < ApplicationRecord
  validates :long_url, :short_url, :user_id, presence: true
  validates :short_url, uniqueness: true
  validate :no_spamming, :non_premium_max

  belongs_to(
    :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'User'
  )

  has_many(
    :visits,
    primary_key: :id,
    foreign_key: :shortened_url_id,
    class_name: 'Visit'
  )

  has_many(
    :visitors,
    Proc.new { distinct },
    through: :visits,
    source: :visitor
  )

  has_many(
    :taggings,
    primary_key: :id,
    foreign_key: :shortened_url_id,
    class_name: 'Tagging'
  )

  has_many(
    :tag_topics,
    through: :taggings,
    source: :tag_topic
  )

  def self.random_code
    rand_str = ""
    loop do
      rand_str = SecureRandom.urlsafe_base64
      break unless ShortenedUrl.exists?(short_url: rand_str)
    end

    rand_str
  end

  def self.create!(user, long_url)
    shortened = ShortenedUrl.random_code
    shortened_obj = ShortenedUrl.new(long_url: long_url, short_url: shortened, user_id: user.id)
    shortened_obj.save
  end

  def self.prune(n)
    not_visited_in_n = ShortenedUrl
      .joins(:visits)
      .where("visits.created_at < ?", n.minute.ago)
    never_visited_older_than_n = ShortenedUrl
      .left_outer_joins(:visits)
      .where("visits.created_at IS NULL
        AND shortened_urls.created_at < ?", n.minute.ago)

    not_visited_in_n.each(&:destroy)
    never_visited_older_than_n.each(&:destroy)
  end

  def num_clicks
    self.visits.length
  end

  def num_uniques
    self.visitors.length
  end

  def num_recent_uniques
    time_passed = Time.now - self.created_at
    ShortenedUrl.select(:user_id).distinct.where("? < 10*60", time_passed).count
  end

  private
  def no_spamming
    urls_in_minute = ShortenedUrl
      .where("created_at > ? AND user_id = ?", 1.minute.ago, user_id)
      .count
    p urls_in_minute
    if urls_in_minute >= 5
      errors[:base] << "Cannot create more than 5 urls in a minute"
    end
  end

  def non_premium_max
    num_urls = ShortenedUrl.where("user_id = ?", user_id).count
    if !submitter.premium && num_urls >= 5
      errors[:base] << "Premium is needed to add more than 5 urls"
    end
  end
end
