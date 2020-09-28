require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe Profile do
    describe '#create' do
    it "バリデーションチェック" do
      profile = build(:profile, first_name: nil )
      profile.valid?
      expect(profile.errors[:first_name]).to include("can't be blank")
    
    end
    it "バリデーションチェック" do
      profile = build(:profile, family_name: nil )
      profile.valid?
      expect(profile.errors[:family_name]).to include("can't be blank")
    
    end
    it "バリデーションチェック" do
      profile = build(:profile, first_name_kana: nil )
      profile.valid?
      expect(profile.errors[:first_name_kana]).to include("can't be blank")
    
    end
    it "バリデーションチェック" do
      profile = build(:profile, family_name_kana: nil )
      profile.valid?
      expect(profile.errors[:family_name_kana]).to include("can't be blank")
    
    end
    it "バリデーションチェック" do
      profile = build(:profile, birth_date: nil )
      profile.valid?
      expect(profile.errors[:birth_date]).to include("can't be blank")
    
    end
  
    end
  end
end
