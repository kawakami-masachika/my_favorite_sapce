class ShopImage < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :shop
end
