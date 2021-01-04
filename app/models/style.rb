class Style < ApplicationRecord
  has_many :shop_styles, dependent: :destroy
  has_many :shops, through: :shop_styles
end
