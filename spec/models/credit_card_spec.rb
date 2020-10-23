require 'rails_helper'

RSpec.describe CreditCard, type: :model do
  describe '#create' do

    # 全てのデータが存在すると登録できる
    it "is valid with all data" do
      credit_card = build(:credit_card)
      expect(credit_card).to be_valid
    end

    # card_idが存在しないと登録できない
    it "is invalid without a card_id" do
      credit_card = build(:credit_card, card_id: "")
      credit_card.valid?
      expect(credit_card.errors[:card_id]).to include("Card を入力してください")
    end

    # customer_idが存在しないと登録できない
    it "is invalid without a customer_id" do
      credit_card = build(:credit_card, customer_id: "")
      credit_card.valid?
      expect(credit_card.errors[:customer_id]).to include("Customer を入力してください")
    end

    # user_idが存在しないと登録できない
    it "is invalid without a user" do
      credit_card = build(:credit_card, user_id: nil)
      credit_card.valid?
      expect(credit_card.errors[:user_id]).to include("User を入力してください")
    end
  end
end
