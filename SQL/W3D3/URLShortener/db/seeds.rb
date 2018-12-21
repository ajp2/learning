# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  TagTopic.destroy_all
  tag_topic_1 = TagTopic.create(topic_name: 'ActiveRecord')
  tag_topic_2 = TagTopic.create(topic_name: 'Ruby')

  Tagging.destroy_all
  tagging_1 = Tagging.create(tag_topic_id: 1, shortened_url_id: 1)
  tagging_2 = Tagging.create(tag_topic_id: 2, shortened_url_id: 2)
end