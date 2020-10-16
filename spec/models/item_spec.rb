require 'rails_helper'

RSpec.describe Item, type: :model do

  describe '#create #update' do
    context 'can save' do
      # 全てのデータが存在すると登録できる
      it "is valid with all data" do
        item = build(:item)
        expect(item).to be_valid
      end
      
      # brand_idが空でも登録できる
      it "is valid without a brand_id" do
        item = build(:item, brand_id: "")
        item.valid?
        expect(item).to be_valid
      end

      # size_idが空でも登録できる
      it "is valid without a size_id" do
        item = build(:item, size_id: "")
        item.valid?
        expect(item).to be_valid
      end
    end
    
    context 'cannot save' do
      
      #商品画像が空だと登録できない
      it "is invalid without a image" do
        item = build(:item)
        item.item_images.delete_all
        item.valid?
        expect(item.errors[:item_images]).to include("can't be blank")
      end

      #nameが空だと登録できない
      it "is invalid without a name" do
        item = build(:item, name: "")
        item.valid?
        expect(item.errors[:name]).to include("can't be blank")
      end
      
      #introductionが空だと登録できない
      it "is invalid without a introduction" do
        item = build(:item, introduction: "")
        item.valid?
        expect(item.errors[:introduction]).to include("can't be blank")
      end
      
      #priceが空だと登録できない
      it "is invalid without a price" do
        item = build(:item, price: "")
        item.valid?
        expect(item.errors[:price]).to include("can't be blank")
      end

      #priceがintegerじゃないと登録できない
      it "is invalid with data type of price except integer" do
        item = build(:item, price: "test")
        item.valid?
        expect(item.errors[:price]).to include("is not a number")
      end
      
      #category_idが空だと登録できない
      it "is invalid without a category_id" do
        item = build(:item, category_id: "")
        item.valid?
        expect(item.errors[:category_id]).to include("can't be blank")
      end
      
      
      # item_condition_idが空だと登録できない
      it "is invalid without a item_condition_id" do
        item = build(:item, item_condition_id: "")
        item.valid?
        expect(item.errors[:item_condition_id]).to include("can't be blank")
      end
      
      # postage_payer_idが空だと登録できない
      it "is invalid without a postage_payer_id" do
        item = build(:item, postage_payer_id: "")
        item.valid?
        expect(item.errors[:postage_payer_id]).to include("can't be blank")
      end
      
      # prefecture_codeが空だと登録できない
      it "is invalid without a prefecture_code" do
        item = build(:item, prefecture_code: "")
        item.valid?
        expect(item.errors[:prefecture_code]).to include("can't be blank")
      end
      
      # preparation_day_idが空だと登録できない
      it "is invalid without a preparation_day_id" do
        item = build(:item, preparation_day_id: "")
        item.valid?
        expect(item.errors[:preparation_day_id]).to include("can't be blank")
      end

      # user_idが空だと登録できない
      it "is invalid without a user_id" do
        item = build(:item, user_id: "")
        item.valid?
        expect(item.errors[:user]).to include("must exist")
      end

    end
  end
end
  