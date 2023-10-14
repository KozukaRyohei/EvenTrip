class Post < ApplicationRecord
  
  before_save :extract_and_save_hashtags

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :hash_post_relations
  has_many :hashtags, through: :hash_post_relations
  has_many_attached :post_images

  def extract_and_save_hashtags
      tags = text.scan(/#\w+/)
      self.hashtags = tags.map do |tag|
        Hashtag.find_or_create_by(name: tag[1..-1])
      end
  end


  def favorited_by?(user)
   favorites.exists?(user_id: user.id)
  end

  def self.favorited_posts(user)
  includes(:favorites)
    .where(favorites: { user_id: user.id })
    .order(created_at: :desc)
  end

end
