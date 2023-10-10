class Post < ApplicationRecord

  belongs_to:user
  has_many :favorites, dependent: :destroy
  has_many_attached :post_images

  def favorited_by?(user)
   favorites.exists?(user_id: user.id)
  end

  def self.favorited_posts(user, page, per_page)
  includes(:favorites)
    .where(favorites: { user_id: user.id }) # 3. ユーザーがいいねしたレコードを絞り込み
    .order(created_at: :desc) # 4. 投稿を作成日時の降順でソート
    .page(page) # 5. ページネーションのため、指定ページに表示するデータを選択
    .per(per_page) # 6. ページごとのデータ数を指定
  end

end
