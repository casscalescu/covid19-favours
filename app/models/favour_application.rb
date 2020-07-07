class FavourApplication < ApplicationRecord
  STATUS = %w[Pending Accepted Rejected Deleted Withdrawn]

  belongs_to :favour
  belongs_to :applicant, class_name: 'User'

  validates :message, presence: true
end
