class Shop < ApplicationRecord
  belongs_to :user
  has_many :shop_images
  has_many :shop_styles, dependent: :destroy
  has_many :styles, through: :shop_styles
  has_many :shop_brands, dependent: :destroy
  has_many :brands, through: :shop_brands
end
