class ShopsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_shop, only: %W(edit update show destroy)
  def index
    @shops = Shop.order(:id).page params[:page]
  end

  def new
    @shop = Shop.new
    @shop.shop_styles.build
    @shop.shop_brands.build
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

  def edit
  end

  def update
    if @shop.update(shop_params)
      redirect_to root_path, flash: {success: "#{@shop.shop_name}の情報を更新しました"}
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy

    if @shop.user_id == current_user.id
      shop_name = @shop.shop_name
      @shop.destroy
      redirect_to root_path, flash: {success: "#{shop_name}の情報を削除しました"}
    else
      redirect_back(fallback_location: root_path, flash: {notice: "投稿ユーザー以外はショップ情報を削除できません"})
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
                                  style_ids:[],
                                  brand_ids: []
                                )
  end

  def set_shop
    @shop = Shop.find(params[:id])
  end
end