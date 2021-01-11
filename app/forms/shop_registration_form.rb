class ShopRegistrationForm
  include ActiveModel::Model

  attr_accessor :shop_name,
                :open_time,
                :close_time,
                :tel_number,
                :site_url,
                :instgram_url,
                :shop_info,
                :sales_info,
                :user_id,
                :shop_style_ids

  def initialize(shop_params = {})
    @shop_name = shop_params[:shop_name]
    @open_time = shop_params[:open_time]
    @close_time = shop_params[:close_time]
    @tel_number = shop_params[:tel_number]
    @instgram_url = shop_params[:instgram_url]
    @site_url = shop_params[:site_url]
    @shop_info = shop_params[:shop_info]
    @sales_info = shop_params[:sales_info]
    @user_id = shop_params[:user_id]
    @shop_style_ids = shop_params[:shop_style_ids]
  end

  validates :shop_name, presence: true
  validates :shop_name, length: {maximum: 100}, if: Proc.new{|shop|shop.shop_name.present?}  #最大文字数

  validates :open_time, :close_time, :tel_number, :user_id, presence: true  #空チェック

  validates :tel_number, length: {maximum: 11}, format: {with: /\A[0-9]+\z/, message: "は数字で入力して下さい"},if: Proc.new{|shop|shop.tel_number.present?} #最大文字数, フォーマット

  validates :shop_info, presence: true
  validates :shop_info, length: {maximum: 500}, if: Proc.new{|shop|shop.shop_info.present?}  #最大文字数

  validates :sales_info, length: {maximum: 50}, if: Proc.new{|shop|shop.sales_info.present?} #最大文字数

  validates :shop_style_ids, presence: {message: :not_select}

  def save
    return false if invalid?
    shop.save!

    if ary_params?(shop_style_ids)
      shop_style(@shop.id)
    end

  end

  private
  def shop
    @shop = Shop.new( shop_name: shop_name,
                  open_time: open_time,
                  close_time: close_time,
                  tel_number: tel_number, 
                  site_url: site_url,
                  instgram_url: instgram_url,
                  shop_info: shop_info,
                  user_id: user_id
                )
  end

  def shop_style(shop_id)
    shop_style_list = []

    shop_style_ids.each do |style_id|
      style_params = {}
      style_params[:shop_id] = shop_id
      style_params[:style_id] = style_id
      shop_style_list << style_params
    end
    ShopStyle.create(shop_style_list)
  end

  # 配列のサイズチェック
  def ary_params?(pram_list)
    pram_list.present? ? true : false
  end
end