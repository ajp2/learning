class Cat < ApplicationRecord
  COLORS = ["black", "white"]

  validates :birth_date, :color, :name, :sex, :description, presence: true
  validates :color, inclusion: COLORS
  validates :sex, inclusion: ["M", "F"]

  def age
    days = (Time.now.to_date - self.birth_date).to_i
    days / 365
  end
end