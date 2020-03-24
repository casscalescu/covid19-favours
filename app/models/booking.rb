class Booking < ApplicationRecord
  belongs_to :favour
  belongs_to :user

  has_many :booking_applicants
end
