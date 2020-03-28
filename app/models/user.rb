class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :favour_applications_sent, :class_name => 'FavourApplication', :foreign_key => 'applicant_id'

  has_many :favours_asked, :class_name => 'Favour', :foreign_key => 'recipient_id'
  has_many :favours_done, :class_name => 'Favour', :foreign_key => 'helper_id'

  has_one_attached :photo
end
