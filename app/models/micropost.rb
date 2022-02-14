class Micropost < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 255 }
  
    has_many :microposts
    has_many :favorites #自分がお気に入りしている投稿内容への参照
    has_many :likes, through: :favorites, source: :micropost #自分がお気にいりしている投稿内容を取得
    has_many :reverses_of_favorite, class_name: "Favorite", foreign_key: "micropost_id"  #自分の投稿内容をお気に入りしているUserへの参照
    has_many :microposters, through: :reverses_of_favorite, source: :user #自分の投稿内容をお気にいりしているUser達

end
