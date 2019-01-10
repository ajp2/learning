class Corgi < ApplicationRecord
  validates :name, uniqueness: true, presence: true

  include Toyable
end
