class FavourApplication < ApplicationRecord
  STATUS = %w[Pending Accepted Rejected]

  belongs_to :favour
  belongs_to :applicant, :class_name => 'User'
end
