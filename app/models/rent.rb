class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :item
  # validates :initial_date, :end_date, :overlap => {:scope => :item.rent}
  validates :initial_date, :end_date, overlap: true

end
