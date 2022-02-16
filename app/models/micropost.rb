class Micropost < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 255 }
  
    has_many :microposts
    has_many :favorites #自分がお気に入りしている投稿内容への参照
    has_many :likes, through: :favorites, source: :micropost #自分がお気にいりしている投稿内容を取得

end
