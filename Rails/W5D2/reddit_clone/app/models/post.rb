class Post < ApplicationRecord
  validates :title, :content, presence: true
  validates :subs, length: { minimum: 1 }

  has_many :post_subs, dependent: :destroy, inverse_of: :post
  has_many :subs, through: :post_subs
  belongs_to :author, foreign_key: :user_id, class_name: 'User'
  has_many :comments
end
