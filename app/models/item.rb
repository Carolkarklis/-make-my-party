class Item < ApplicationRecord
  mount_uploader :picture, PictureUploader
  has_many :reviews
  has_many :rents

end
