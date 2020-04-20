class ReviewsController < ApplicationController
  def new
    @favour = Favour.find(params[:favour_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @favour = Favour.find(params[:favour_id])
    @review.favour = @favour
    if current_user == @favour.helper
    	@review.helper = current_user
    	@review.recipient = @favour.recipient
      @review.subject = "Recipient"
      @review.save
      @review.recipient.reviews_recipient_average
    end
    if current_user == @favour.recipient
    	@review.recipient = current_user
    	@review.helper = @favour.helper
      @review.subject = "Helper"
      @review.save
      @review.helper.reviews_helper_average
    end
    redirect_to dashboard_path
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end
end
