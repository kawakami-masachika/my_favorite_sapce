class ShopBrand < ApplicationRecord
  belongs_to :shop
  belongs_to :brand

  # バリデーション
  validates :shop, presence: true
  validates :brand_id, uniqueness: {scope: :shop_id}
end
