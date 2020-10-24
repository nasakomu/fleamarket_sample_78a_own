class CreditCard < ApplicationRecord
  belongs_to :user
  validates :card_id, presence: { message: "%{attribute} を入力してください" }
  validates :customer_id, presence: { message: "%{attribute} を入力してください" }
  validates :user_id, presence: { message: "%{attribute} を入力してください" }
end
