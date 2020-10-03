require 'rails_helper'

RSpec.describe Destination, type: :model do
  it "バリデーションチェック" do
    destination = build(:destination, first_name: nil )
    destination.valid?
    expect(destination.errors[:first_name]).to include("can't be blank")
  end  
  it "バリデーションチェック" do
    destination = build(:destination, family_name: nil )
    destination.valid?
    expect(destination.errors[:family_name]).to include("can't be blank")
  end  
  it "バリデーションチェック" do
    destination = build(:destination, first_name_kana: nil )
    destination.valid?
    expect(destination.errors[:first_name_kana]).to include("can't be blank")
  end  
  it "バリデーションチェック" do
    destination = build(:destination, family_name_kana: nil )
    destination.valid?
    expect(destination.errors[:family_name_kana]).to include("can't be blank")
  end  
  it "バリデーションチェック" do
    destination = build(:destination, postal_code: nil )
    destination.valid?
    expect(destination.errors[:postal_code]).to include("can't be blank")
  end  
  it "バリデーションチェック" do
    destination = build(:destination, house_number: nil )
    destination.valid?
    expect(destination.errors[:house_number]).to include("can't be blank")
  end  

end
