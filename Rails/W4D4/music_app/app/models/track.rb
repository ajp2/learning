class Track < ApplicationRecord
  validates :title, :ord, :album_id, :bonus, presence: true

  belongs_to :album
  has_many :notes
end
