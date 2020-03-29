class Favour < ApplicationRecord
  CATEGORY = %w[Groceries Gardening Pets Other]
  STATUS = %w[Open Accepted Done Expired Deleted]

  # Associations
  belongs_to :recipient, :class_name => 'User', optional: true
  belongs_to :helper, :class_name => 'User', optional: true

  has_many :reviews
  has_many :favour_applications

  # Validations
  validates :category, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :address, presence: true

  # Simple form collections
  def categories
  	CATEGORY
  end
end
