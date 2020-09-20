class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_many :item_images, dependent: :destroy
  accepts_nested_attributes_for :item_images, allow_destroy: true

  belongs_to :category
  belongs_to_active_hash :size
  belongs_to :brand, optional: true
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :preparation_day
  belongs_to_active_hash :status
  # belongs_to :user

  with_options presence: true do
    validates :name
    validates :introduction
    validates :price
    validates :category

    with_options numericality: { other_than: 1 } do
      validates :size_id
      validates :item_condition_id
      validates :postage_payer_id
      validates :prefecture_code
      validates :preparation_day_id
    end
  end
end