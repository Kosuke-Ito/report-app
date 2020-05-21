class Post < ApplicationRecord
	belongs_to :user
	has_many :comments

	validates :user_id, presence: true
  validates :title,   presence: true, length: { minimum:1, maximum: 50}
	validates :content, presence: true, length: { minimum:1, maximum: 10000}
end
