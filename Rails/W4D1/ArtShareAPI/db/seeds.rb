# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  User.destroy_all
  Artwork.destroy_all
  ArtworkShare.destroy_all

  u1 = User.create!(username: "George")
  u2 = User.create!(username: "Bill")
  u3 = User.create!(username: "Geoff")

  a1 = Artwork.create!(title: "Mona Lisa", image_url: "www.test.com", artist_id: u1.id)
  a2 = Artwork.create!(title: "Starry Night", image_url: "www.test.com", artist_id: u2.id)
  a3 = Artwork.create!(title: "The Last Supper", image_url: "www.test.com", artist_id: u2.id)

  as1 = ArtworkShare.create!(artwork_id: a1.id, viewer_id: u2.id)
  as2 = ArtworkShare.create!(artwork_id: a2.id, viewer_id: u3.id)
  as3 = ArtworkShare.create!(artwork_id: a3.id, viewer_id: u3.id)
end