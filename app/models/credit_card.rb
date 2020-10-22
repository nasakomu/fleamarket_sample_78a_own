class CreditCard < ApplicationRecord
  belongs_to :user
  validates :card_id, :customer_id, :user, presence: true
end
