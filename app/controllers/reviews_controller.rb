class ReviewsController < ApplicationController
  def new
    @favour = Favour.find(params[:favour_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @favour = Favour.find(params[:favour_id])
    @review.favour_id = @favour
    if current_user == @favour.helper?
    	@review.helper_id = current_user.id
    	@review.recipient_id = @favour.recipient.id
      @review.subject = "Helper"
    end
    if current_user == @favour.recipient?
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
