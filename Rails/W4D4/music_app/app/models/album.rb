class Album < ApplicationRecord
  validates :title, :year, :band_id, :studio_album, presence: true

  belongs_to :band
end
