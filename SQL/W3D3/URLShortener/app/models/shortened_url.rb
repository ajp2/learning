class ShortenedUrl < ApplicationRecord
  validates :long_url, :short_url, :user_id, presence: true
  validates :short_url, uniqueness: true

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

  def num_clicks
    self.visits.length
  end

  def num_uniques
    self.visitors.length
  end

  def num_recent_uniques
    time_passed = Time.now - self.created_at
    ShortenedUrl.select(:user_id).distinct.where(Time.now - created_at < 10*60).length
  end
end