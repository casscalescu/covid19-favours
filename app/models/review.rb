class Review < ApplicationRecord
  belongs_to :recipient, :class_name => 'User'
  belongs_to :helper, :class_name => 'User'
  belongs_to :favour
end
