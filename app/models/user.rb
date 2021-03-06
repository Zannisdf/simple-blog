class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :comments
  has_many :favourites, dependent: :destroy
  has_many :likes
  validates :name, presence: true, uniqueness: true

  enum role: %i[user visit author moderator]
end
