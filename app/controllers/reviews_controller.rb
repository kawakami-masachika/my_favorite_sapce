class ReviewsController < ApplicationController
  def new
    @shop = Shop.find(params[:shop_id])
    @review = current_user.reviews.build
  end

  def create
    @review = current_user.reviews.build(review_params)
    @review.shop_id = params[:shop_id]
    if @review.save
      redirect_to shop_path(@review.shop_id), flash: {success: "#{Shop.find(@review.shop_id).shop_name}のレビューを投稿しました"}
    else
      @shop = Shop.find(params[:shop_id])
      render 'reviews/new'
    end
  end

  def edit
    @shop = Shop.find(params[:shop_id])
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to shop_path(@review.shop_id), flash: {success: "#{Shop.find(@review.shop_id).shop_name}のレビューを更新しました"}
    else
      @shop = Shop.find(params[:shop_id])
      render 'reviews/edit'
    end
  end

  private
  def review_params
    params.require(:review).permit(:title, :rate, :content)
  end
end
