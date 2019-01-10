class Sub < ApplicationRecord
  validates :title, :description, presence: true

  has_many :post_subs, dependent: :destroy, inverse_of: :sub
  has_many :posts, through: :post_subs
  belongs_to :moderator, foreign_key: :user_id, class_name: 'User'
end
