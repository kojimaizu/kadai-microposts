class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :micropost, class_name: "User"
  
  has_many :microposts
  has_many :favorites
  has_many :micropostings, through: :favorites, source: :micropost
  has_many :reverses_of_favorite, class_name: "Favorite", foreign_key: "micropost_id"
  has_many :microposters, through: :reverses_of_favorite, source: :user

  def micropost(other_user)
    unless self == other_user
      self.favorites.find_or_create_by(micropost_id: other_user.id)
    end
  end

  def unmicropost(other_user)
    favorite = self.favorites.find_by(micropost_id: other_user.id)
    favorite.destroy if favorite
  end

  def microposting?(other_user)
    self.micropostings.include?(other_user)
  end

end
