class TagTopic < ApplicationRecord
  validates :topic_name, presence: true, uniqueness: true

  has_many(
    :taggings,
    primary_key: :id,
    foreign_key: :tag_topic_id,
    class_name: 'Tagging'
  )

  has_many(
    :tags,
    through: :taggings,
    source: :shortened_url
  )
  def popular_links
    sorted_tags = self.tags.sort { |x, y| y.num_clicks <=> x.num_clicks }
    sorted_tags.map { |url| [url, url.num_clicks] }.take(5)
  end
end