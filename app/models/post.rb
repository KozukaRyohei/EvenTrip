class Post < ApplicationRecord

  before_save :extract_and_save_hashtags

  belongs_to :user
  belongs_to :event
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :hash_post_relations, dependent: :destroy
  has_many :hashtags, through: :hash_post_relations

  validates :text, presence: true
  validates :post_images, presence: { message: 'を選択してください。' }

  has_many_attached :post_images

  def extract_and_save_hashtags
      tags = text.gsub(/(?<=\s|^)#\S+/)
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
