class Favour < ApplicationRecord
  CATEGORY = %w[Groceries Gardening Pets Other]
  STATUS = %w[Open Accepted Done Expired Deleted]

  # Geocoded
  geocoded_by :address

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

  after_validation :geocode, if: :will_save_change_to_address?

  # Simple form collections
  def categories
  	CATEGORY
  end

  def accepted
    self.favour_applications.each do |app|
      app.status == "Rejected" unless app.status == "Accepted"
    end

    self.status = "Accepted"
  end
end
