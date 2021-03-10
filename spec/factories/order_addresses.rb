FactoryBot.define do
  factory :order_address do
    postal_code{'123-4567'}
    prefecture_id{1}
    city{Faker::Address.city}
    address_line1{Faker::Address.street_address}
    address_line2{Faker::Address.building_number}
    phone_number{Faker::Number.number(digits: 11)}
  end
end
