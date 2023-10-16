class Event < ApplicationRecord

  has_one_attached :event_image

  validates :name, presence: true
  validates :hold_date, presence: true
  validates :hold_place, presence: true

  def get_event_image(width, height)
    unless event_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.png')
      event_image.attach(io: File.open(file_path), filename: 'default-image.png', content_type: 'image/png')
    end
      event_image.variant(resize_to_limit: [width, height]).processed
  end
end
