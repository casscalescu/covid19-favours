class FavoursController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_favour, only: [:edit, :update, :show]

  def new
	  @favour = Favour.new
	end

	def create
		@favour = Favour.new(favour_params)
		@favour.recipient = current_user
		@favour.status = "Open"
		@favour.save
		redirect_to favour_path(@favour)
	end

	def show
    # raise
    @favour_application = @favour.favour_applications.where(applicant: current_user).take
	end

	def index
    if params[:query].present?
      @open_favours = Favour.where(status: "Open").near(params[:query][:location], 50, units: :km, order: 'distance').order(created_at: :desc)
      @nearby_favours = true
      if @open_favours.empty?
        @open_favours = Favour.where(status: "Open").order(created_at: :desc)
        @nearby_favours = false
      end
    else
      @nearby_favours = true
      @open_favours = Favour.where(status: "Open").order(created_at: :desc)
    end
	end

	def edit
	end

	def update
		@favour.update(favour_params)
		redirect_to favour_path(@favour)
	end

	private

	def set_favour
  	@favour = Favour.find(params[:id])
  end

	def favour_params
    params.require(:favour).permit(:title, :description, :address, :category, :completion_date, :status)
  end
end
