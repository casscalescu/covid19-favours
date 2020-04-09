class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @helper_accepted = Favour
      .where(helper: current_user, status: 'Accepted')

    @helper_open = Favour
      .joins(:favour_applications)
      .where(favour_applications: { applicant: current_user, status: 'Pending' })

    @helper_archived = Favour
      .joins(:favour_applications)
      .where(helper: current_user, status: 'Done')
      .or(Favour
        .joins(:favour_applications)
        .where(helper: current_user, status: 'Closed'))
      .or(Favour
        .joins(:favour_applications)
        .where(favour_applications: { applicant: current_user, status: 'Rejected' }))

    @recipient_accepted = Favour
      .where(recipient: current_user, status: 'Accepted')

    @recipient_open = Favour
      .where(recipient: current_user, status: 'Open')

    @recipient_archived = Favour
      .where(recipient: current_user, status: 'Done')
      .or(Favour.where(recipient: current_user, status: 'Closed'))

    @recipient_done_favours = Favour
      .where(recipient: current_user, status: 'Done')
    @helper_done_favours = Favour
      .where(helper: current_user, status: 'Done')

    @recipient_favours_expiring = Favour
      .where(recipient: current_user, status: 'Open')
      .where('completion_date < ?', Date.today + 2)
  end
end
