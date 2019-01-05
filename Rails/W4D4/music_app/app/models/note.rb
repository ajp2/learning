class Note < ApplicationRecord
  validates :info, :user_id, :track_id, presence: true

  belongs_to :user
  belongs_to :track
end
