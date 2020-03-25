class FavourApplication < ApplicationRecord
  belongs_to :favour
  belongs_to :applicant, :class_name => 'User'
end
