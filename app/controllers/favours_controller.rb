class FavoursController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_favour, only: [:edit, :update, :show]

  def new
	  @favour = Favour.new
	  @recipient_id = current_user
	end

	def create
		@favour = Favour.new(favour_params)
		@favour.recipient = current_user
		@favour.save
		redirect_to favour_path(@favour)
	end

	def show
    @favour_application = @favour.favour_applications.where(applicant: current_user).take
	end

	def index
		@favours = Favour.all
		@open_favours = Favour.where(status: "Open")
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
    params.require(:favour).permit(:title, :description, :address, :category, :completion_date)
  end
end
