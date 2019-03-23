class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favourites, dependent: :destroy
  validates :content, presence: true
  validates :title, presence: true

  def creation_date
    created_at.strftime('%B %d, %Y')
  end
end
