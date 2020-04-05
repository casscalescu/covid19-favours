class UsersController < ApplicationController
	before_action :set_user, only: [:edit, :update, :show]

  def edit
  end

  def update
  	@user.update(user_params)
		redirect_to user_path(@user)
  end

  def show
    @shared_task = @user.favours_asked.where(helper_id: current_user.id).exists? || @user.favours_done.where(recipient_id: current_user.id).exists?
    @open_favours = @user.favours_asked.where(status: "Open")
    raise
  end

  private

  def set_user
  	@user = User.find(params[:id])
  end

  def user_params
  	params.require(:user).permit(:photo, :first_name, :last_name, :mobile, :address, :bio)
  end
end