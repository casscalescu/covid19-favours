class FavoursController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

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
		@favour = Favour.find(params[:id])
	end

	def index
		@favours = Favour.all
		@open_favours = Favour.where(status: "Open")
	end

	private

	def favour_params
    params.require(:favour).permit(:title, :description, :address, :category, :completion_date)
  end
end
