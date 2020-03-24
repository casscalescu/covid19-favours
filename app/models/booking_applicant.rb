class BookingApplicant < ApplicationRecord
  belongs_to :user
  belongs_to :booking
end
