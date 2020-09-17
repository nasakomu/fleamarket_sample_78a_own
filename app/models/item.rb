class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :images, dependent: :destroy
  belongs_to :category
  belongs_to_active_hash :size
  belongs_to :brand
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :preparation_day
  belongs_to_active_hash :status
  belongs_to :user

  with_options presence: true do
    validates :name
    validates :introduction
    validates :price
    validates :category

    # with_options numericality: { other_than: 1 } do
    #   validates :size
    #   validates :item_condition
    #   validates :postage_payer
    #   validates :prefecture_code
    #   validates :preparation_day
    # end
  end
end