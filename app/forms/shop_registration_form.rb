class ShopRegistrationForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :shop_name, :string
  attribute :open_time, :time
  attribute :close_time, :time
  attribute :tel_number, :string
  attribute :site_url, :string
  attribute :instgram_url, :string
  attribute :shop_info, :string
  attribute :sales_info, :string
  attribute :user_id, :big_integer

  def save
    shop.save!
  end

  private
  def shop
    Shop.create( shop_name: shop_name, 
                  open_time: open_time,
                  close_time: close_time,
                  tel_number: tel_number, 
                  site_url: site_url,
                  instgram_url: instgram_url,
                  shop_info: shop_info,
                  user_id: user_id
                )
  end
end