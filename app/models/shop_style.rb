class ShopStyle < ApplicationRecord
  belongs_to :shop
  belongs_to :style

  # バリデーション
  validates :shop, presence: true
  validates :style_id, uniqueness: {scope: :shop_id}
end
