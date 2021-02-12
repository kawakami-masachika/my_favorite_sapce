class Shop < ApplicationRecord
  paginates_per 20
  belongs_to :user
  has_many :shop_images
  has_many :shop_styles, dependent: :destroy, validate: true, inverse_of: :shop
  has_many :styles, through: :shop_styles
  has_many :shop_brands, dependent: :destroy, validate: true, inverse_of: :shop
  has_many :brands, through: :shop_brands
  has_many :reviews
  has_many :like_shops

  enum treatment: {male: 0, female: 1, unisex: 2}

  accepts_nested_attributes_for :shop_styles, allow_destroy: true
  accepts_nested_attributes_for :shop_images, allow_destroy: true
  accepts_nested_attributes_for :shop_brands, allow_destroy: true

  # バリデーション
  validates :shop_name, presence: true
  validates :shop_name, length: {maximum: 100}, if: Proc.new{|shop|shop.shop_name.present?}
  validates :open_time, :close_time, :tel_number, :user_id, presence: true
  validates :tel_number, length: {maximum: 11}, format: {with: /\A[0-9]+\z/, message: :not_a_number},if: Proc.new{|shop|shop.tel_number.present?}
  validates :treatment, presence: {message: :not_select}
  validates :sales_info, length: {maximum: 50}, if: Proc.new{|shop|shop.sales_info.present?}
  validates :shop_info, presence: true
  validates :shop_info, length: {maximum: 500}, if: Proc.new{|shop|shop.shop_info.present?}
  validates :style_ids, presence: {message: :not_select}
  validates :brand_ids, presence: {message: :not_select}
  
  # 関連付け先バリデーション
  validates_associated :shop_styles, :shop_brands
end
