FactoryBot.define do
  factory :item do
    name { Faker::Name.initials(number: 2) }
    category_id {Category.all.sample}
    condition_id {1}
    explain {Faker::Lorem.sentence}
    fee_id { 1 }
    prefecture_id  {1}
    delivery_id   {1}
    price  {'1000'}        
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
