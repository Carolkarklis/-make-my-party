class Item < ApplicationRecord
  mount_uploader :picture, PictureUploader
  belongs_to :user
  has_many :reviews
  has_many :rents

  def self.search(search)
    where("product_name ILIKE ?", "%#{search}%")
    where("description ILIKE ?", "%#{search}%")
  end

end
