class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :user_image


  has_many:posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  validates :name, presence: true
  validates :phone_number, presence: true


  def get_user_image(width, height)
    unless user_image.attached?
      file_path = Rails.root.join('app/assets/images/guest_image.jpg')
      user_image.attach(io: File.open(file_path), filename: 'guest_image.jpg', content_type: 'image/jpg')
    end
      user_image.variant(resize_to_limit: [width, height]).processed
  end

end
