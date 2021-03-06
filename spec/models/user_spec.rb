require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do
    describe '#create' do
      # 1. nicknameとemail、passwordとpassword_confirmationが存在すれば登録できること
      it "is valid with a nickname, email, password, password_confirmation" do
        user = build(:user)
        expect(user).to be_valid
      end
  
      #2. nicknameが空では登録できないこと
      it "is invalid without a nickname" do
        user = build(:user, nickname: nil)
        user.valid?
        expect(user.errors[:nickname]).to include("can't be blank")
      end
  
      # 3. emailが空では登録できないこと
      it "is invalid without a email" do
        user = build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include("can't be blank")
      end
  
      # 4. passwordが空では登録できないこと
      it "is invalid without a password" do
        user = build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include("can't be blank")
      end
  
      # 5. passwordが存在してもpassword_confirmationが空では登録できないこと
      it "is invalid without a password_confirmation although with a password" do
        user = build(:user, password_confirmation: "")
        user.valid?
        expect(user.errors[:password_confirmation]).to include("doesn't match Password")
      end
  
      # 8. 重複したemailが存在する場合登録できないこと
      it "is invalid with a duplicate email address" do
        user = create(:user)
        another_user = build(:user, email: user.email)
        another_user.valid?
        expect(another_user.errors[:email]).to include("has already been taken")
      end
  
      # 9. passwordが7文字以上であれば登録できること
      it "is valid with a password that has more than 6 characters " do
        user = build(:user, password: "0000000", password_confirmation: "0000000")
        expect(user).to be_valid
      end
  
      it "重複したメールアドレスの場合、無効である" do
        user1 = create(:user)
        user2 = build(:user)
        user2.valid?
        expect(user2.errors[:email]).to include("has already been taken")
      end
      it "パスワードがない場合、無効である" do
      user = build(:user)
      user.password = ""
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
      end
      
    
    end
  end
end
