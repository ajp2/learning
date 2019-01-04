class Track < ApplicationRecord
  validates :title, :ord, :album_id, :bonus, presence: true

  belongs_to :album
end
