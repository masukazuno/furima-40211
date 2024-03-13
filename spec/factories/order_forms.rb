FactoryBot.define do
  factory :order_form do
    item_id { 1 }
    user_id { 1 }
    post_code { Faker::Number.between(from: 100, to: 999).to_s + "-" + Faker::Number.between(from: 1000, to: 9999).to_s }
    prefecture_code_id { Faker::Number.between(from: 1, to: 47) }
    city { Faker::Address.city }
    house_number { Faker::Address.street_address }
    building_name { Faker::Address.building_number }
    phone_number { "0" + Faker::Number.between(from: 100000000, to: 9999999999).to_s }
    token { Faker::Internet.password(min_length: 20, max_length: 30) }
  end
end