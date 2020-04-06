class ReviewsController < ApplicationController
  def new
    @favour = Favour.find(params[:favour_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @favour = Favour.find(params[:favour_id])
    @review.favour_id = @favour.id
    if current_user.helper?
    	@review.helper_id = current_user.id
    	@review.recipient_id = @favour.recipient.id
      @review.subject = "Helper"
    elsif current_user.recipient?
    	@review.recipient_id = current_user.id
    	@review.helper_id = @favour.helper.id
      @review.subject = "Recipient"
    end
    @review.save
    redirect_to dashboard_path
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end
end
