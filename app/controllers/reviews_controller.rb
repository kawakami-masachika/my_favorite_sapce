class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.shop_id = params[:id]
    if @review.save
      redirect_to shops_path
    else
      render 'new'
    end
  end

  private
  def review_params
    params.require(:review).permit(:title, :rate, :content)
  end
end
