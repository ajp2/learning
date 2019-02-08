class Bench < ApplicationRecord
  validates :description, :lat, :lng, presence: true

  def self.in_bounds(bounds)
    return Bench.all if bounds.nil?

    northEast = bounds["northEast"]
    southWest = bounds["southWest"]
    Bench.all
      .where("lat >= ? AND lat <= ?", southWest["lat"], northEast["lat"])
      .where("lng >= ? AND lng <= ?", southWest["lng"], northEast["lng"])
  end
end
