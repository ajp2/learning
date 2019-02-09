class Bench < ApplicationRecord
  validates :description, :lat, :lng, presence: true

  def self.in_bounds(bounds, min_seating, max_seating)
    return Bench.all if bounds.nil?

    northEast = bounds["northEast"]
    southWest = bounds["southWest"]
    filteredBenches = Bench.all
      .where("lat >= ? AND lat <= ?", southWest["lat"], northEast["lat"])
      .where("lng >= ? AND lng <= ?", southWest["lng"], northEast["lng"])
    
    filteredBenches = filteredBenches.where("seating >= ?", min_seating) if min_seating
    filteredBenches = filteredBenches.where("seating <= ?", max_seating) if max_seating
    return filteredBenches
  end
end
