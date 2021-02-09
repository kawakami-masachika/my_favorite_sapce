class ReviewsController < ApplicationController
  def new
    @review = current_user.reviews.new
  end

  def create
    @review = current_user.reviews.new(review_params)
    @review.shop_id = params[:shop_id]
    if @review.save
      redirect_to shop_path, flash: {success: "#{Shop.find(@review.shop_id).shop_name}のレビューを投稿しました"}
    else
      render 'new'
    end
  end

  private
  def review_params
    params.require(:review).permit(:title, :rate, :content)
  end
end
