class Favour < ApplicationRecord
  belongs_to :recipient, :class_name => 'User'
  belongs_to :helper, :class_name => 'User'

  has_many :reviews
  has_many :favour_applications
end
