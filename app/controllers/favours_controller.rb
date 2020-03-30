class FavoursController < ApplicationController
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
	end

	private

	def favour_params
    params.require(:favour).permit(:title, :description, :address, :category)
  end
end
