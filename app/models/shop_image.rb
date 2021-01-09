class ShopImage < ApplicationRecord
  mount_uploaders :images, ImageUploader
  belongs_to :shops
end
