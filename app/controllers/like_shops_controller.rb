class LikeShopsController < ApplicationController
  before_action :set_shop
  def create
    binding.pry
    current_user.like_shops.create(shop_id: @shop.id)
  end

  def destroy
    current_user.like_shops.find_by(shop_id: params[shop_id]).destroy
  end

  private
  def set_shop
    @shop = Shop.find(params[:shop_id])
  end
end
