FactoryBot.define do
  factory :item do
    name                {"sample"}
    introduction        {"サンプルです"}
    price               {"111111"}
    size_id             {"2"}
    item_condition_id   {"2"}
    postage_payer_id    {"2"}
    prefecture_code     {"2"}
    preparation_day_id  {"2"}
    status_id           {"1"}
    category_id         {create(:category).id}
    brand_id            {create(:brand).id}
    user_id             {create(:user).id}

    after(:build) do |item|
      item.item_images << FactoryBot.build(:item_image, item: item)
    end
  end
end
