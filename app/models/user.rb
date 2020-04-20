class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :photo

  has_many :favour_applications_sent, class_name: 'FavourApplication', foreign_key: 'applicant_id'

  has_many :favours_asked, class_name: 'Favour', foreign_key: 'recipient_id'
  has_many :favours_done, class_name: 'Favour', foreign_key: 'helper_id'

  has_many :recipient_reviews, class_name: 'Review', foreign_key: 'recipient_id'
  has_many :helper_reviews, class_name: 'Review', foreign_key: 'helper_id'

  def helper?
    applications = FavourApplication.where(applicant: self)
    applications.length > 0 ? true : false
  end

  def recipient?
    favours = Favour.where(recipient: self)
    favours.length > 0 ? true : false
  end

  def applied?(favour)
    applications = FavourApplication.where(applicant: self, favour: favour)
    applications.length > 0 ? true : false
  end

  def application_status(favour)
    applications = FavourApplication.where(applicant: self, favour: favour)
    applications[0].status
  end

  def shared_tasks(user)
    Favour.where(recipient: self, helper: user).or(Favour.where(helper: self, recipient: user))
  end

  def shared_tasks?(user)
    shared = Favour.where(recipient: self, helper: user).or(Favour.where(helper: self, recipient: user))
    shared.empty? ? false : true
  end

  def open_favours
    Favour.where(status: "Open", recipient: self)
  end

  # get all the ratings
  # calculate two averages
  # update the average when new review
end
