class FavourApplicationsController < ApplicationController
  before_action :set_favour, only: [:new, :create, :index, :update]
  before_action :set_favour_application, only: [:update]

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

  def update
    @favour_application.update(favour_application_params)
    redirect_to favour_path(@favour)
  end

  private

  def set_favour
    @favour = Favour.find(params[:favour_id])
  end

  def set_favour_application
    @favour_application = FavourApplication.find(params[:id])
  end

  def favour_application_params
    params.require(:favour_application).permit(:message, :status)
  end
end
