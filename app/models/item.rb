class Item < ApplicationRecord
  has_many :images, dependent: :destroy
  belongs_to :category
  belongs_to_active_hash :size
  belongs_to :brand
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :potage_payer
  belongs_to_active_hash :preparation_day
  belongs_to_active_hash :status
  belongs_to :user

  validates :name
end

