class Item < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  mount_uploader :picture, PictureUploader
  belongs_to :user
  has_many :reviews
  has_many :rents
  validates :picture, :price, :product_name, :address, presence: true
  after_create :send_new_item_email

  def self.search(search)
    where("product_name ILIKE ?", "%#{search}%")
  end

  private

  def send_new_item_email
    ItemMailer.new_item(self).deliver_now
  end
end

