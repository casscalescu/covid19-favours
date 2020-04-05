class ReviewsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @user = User.find(params[:user_id])
    if @user.helper?
    	@review.helper_id = @user.id
    	@review.recipient_id = current_user.id
    elsif @user.recipient?
    	@review.recipient_id = @user.id
    	@review.helper_id = current_user.id
    end
    @review.save
    redirect_to user_path(@user)
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end
end
