class Post < ApplicationRecord
  validates :title, :content, presence: true

  belongs_to :sub
  belongs_to :author, foreign_key: :user_id, class_name: 'User'
end
