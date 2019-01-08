class Goal < ApplicationRecord
  validates :title, :details, presence: true
  validates :completed, :private, inclusion: [true, false]

  belongs_to :user
end