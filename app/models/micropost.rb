class Micropost < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 255 }
  
  has_many :favorites
  has_many :microposters, through: :favorites, source: :user
  has_many :reverses_of_favorite, class_name: "Favorite", foreign_key: "user_id"
  has_many :micropostings, through: :reverses_of_favorite, source: :micropost
  
end
