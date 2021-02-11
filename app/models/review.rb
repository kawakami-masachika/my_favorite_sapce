class Review < ApplicationRecord
  belongs_to :user
  belongs_to :shop

  validates :title, :rate, :content, presence: true
  validates :title, length: {maximum: 50}, if: Proc.new{|review|review.title.present?}
  validates :content, length: {maximum: 1000}, if: Proc.new{|review|review.content.present?}
  validates :shop, presence: true
  validates :user, presence: true
  validates :user_id, uniqueness: {scope: :shop_id}, if: Proc.new{|review|review.title.present? && review.rate.present? && review.content.present?}
end
