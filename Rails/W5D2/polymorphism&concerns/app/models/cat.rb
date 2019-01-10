class Cat < ApplicationRecord
  validates :name, uniqueness: true, presence: true

  include Toyable
end
