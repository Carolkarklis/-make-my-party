class Item < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  mount_uploader :picture, PictureUploader
  belongs_to :user
  has_many :reviews
  has_many :rents
  validates :picture, presence: true

  def self.search(search)
    where("product_name ILIKE ?", "%#{search}%")
  end

end

