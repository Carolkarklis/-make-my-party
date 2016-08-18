class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :item
  validates :quantity, numericality: { less_than_or_equal_to: proc { |rent| rent.item.quantity }}
end
