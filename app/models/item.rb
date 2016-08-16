class Item < ApplicationRecord
  mount_uploader :picture, PictureUploader
  belongs_to :user
  has_many :reviews
  has_many :rents

end
