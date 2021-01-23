class ShopsController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def new
    @shop = Shop.new
    @shop.shop_styles.build
    2.times{@shop.shop_images.build}
    @shop.user_id =  current_user.id
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      flash[:success] = "新たにショップを登録しました"
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
  def shop_params
    params.require(:shop).permit(
                                  :shop_name,
                                  :open_time,
                                  :close_time,
                                  :tel_number,
                                  :treatment,
                                  :site_url,
                                  :instgram_url,
                                  :shop_info,
                                  :sales_info,
                                  :user_id,
                                  shop_images_attributes: [:id, :image, :image_cache],
                                  style_ids:[]
                                )
  end
end