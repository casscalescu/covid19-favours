class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @helper_accepted =
    @helper_open =
    @helper_archived =

    @recipient_accepted =
    @recipient_open =
    @recipient_archived =
  end
end
