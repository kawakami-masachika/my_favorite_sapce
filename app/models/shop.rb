class Shop < ApplicationRecord
  belongs_to :user
  has_many :shop_styles, dependent: :destroy
  has_many :styles, through: :shop_styles
end
