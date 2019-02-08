# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

b1 = Bench.create(description: "a bench", lat: 37.763589, lng: -122.475647)
b2 = Bench.create(description: "real bench", lat: 37.783584 , lng: -122.490816)
b3 = Bench.create(description: "Best Bench", lat: 37.633586, lng: -122.449700)
b4 = Bench.create(description: "Superbench", lat: 37.659166, lng: -122.396307)
b5 = Bench.create(description: "another bench", lat: 37.448201, lng: -122.159616)
b6 = Bench.create(description: "special bench", lat: 37.752495, lng: -122.493711)