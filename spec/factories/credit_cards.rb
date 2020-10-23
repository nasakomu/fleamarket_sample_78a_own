FactoryBot.define do
  factory :credit_card do
    card_id      {"car_12345"}
    customer_id  {"cus_12345"}
    user_id      {create(:user).id} 
  end
end
