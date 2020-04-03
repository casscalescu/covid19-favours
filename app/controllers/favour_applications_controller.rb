class FavourApplicationsController < ApplicationController
  before_action :set_favour, only: [:new, :create, :index]

  def new
    @favour_application = FavourApplication.new
  end

  def create
    @favour_application = FavourApplication.new(favour_application_params)
    @favour_application.favour = @favour
    @favour_application.applicant = current_user
    @favour_application.status = "Pending"
    @favour_application.save
    redirect_to favour_path(@favour)
  end

  def index

  end

  def destroy
    @favour_application = FavourApplication.find(params[:id])
    @favour_application.status = "Withdrawn"
    @favour_application.save
    redirect_to favour_path(@favour_application.favour)
  end

  private

  def set_favour
    @favour = Favour.find(params[:favour_id])
  end

  def favour_application_params
    params.require(:favour_application).permit(:message)
  end
end
