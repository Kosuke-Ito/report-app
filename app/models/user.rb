class User < ApplicationRecord
	has_many :posts, dependent: :destroy
	has_many :comments, dependent: :destroy

	validates :name,     presence: true, length: { minimum: 4, maximum: 10 }, uniqueness: { case_sensitive: true }
	validates :password, presence: true, length: { minimum: 4, maximum: 10 }, allow_nil: true
  validates :password_digest, presence: true, on: :update
  has_secure_password
end
