class Hashtag < ApplicationRecord

  validates :name, presence: true, length: { maximum:99}
  has_many :hash_post_relations
  has_many :posts, through: :hash_post_relations

end
