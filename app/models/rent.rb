class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :item
  # validates :initial_date, :end_date, :overlap => {:scope => :item.rent}
  validates :initial_date, :end_date, overlap: true
  after_create :send_new_rent_email

  private

  def send_new_rent_email
    RentMailer.new_rent(self).deliver_now
  end
end
