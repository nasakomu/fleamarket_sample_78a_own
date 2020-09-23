FactoryBot.define do
  factory :item_image do
    url   { Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/fixtures/sample.png"), 'image/png')}
    item
  end
end
