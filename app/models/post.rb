class Post < ApplicationRecord

  belongs_to:user
  has_many :favorites, dependent: :destroy
  has_many_attached :post_images

  def favorited_by?(user)
   favorites.exists?(user_id: user.id)
  end

  def self.favorited_posts(user)
  includes(:favorites)
    .where(favorites: { user_id: user.id })
    .order(created_at: :desc)
  end

end
