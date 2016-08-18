class Item < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  mount_uploader :picture, PictureUploader
  belongs_to :user
  has_many :reviews
  has_many :rents
  validates :picture, :price, :product_name, presence: true

end
