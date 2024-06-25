FactoryBot.define do
  factory :item do
    name              { Faker::Games::Pokemon.name }
    description       { Faker::Games::Pokemon.location }
    category_id       { Faker::Number.between(from: 2, to: 11) }
    condition_id      { Faker::Number.between(from: 2, to: 7) }
    charge_id         { Faker::Number.between(from: 2, to: 3) }
    prefecture_id     { Faker::Number.between(from: 2, to: 47) }
    until_shipping_id { Faker::Number.between(from: 2, to: 4) }
    price             { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'a.png')
    end
  end
end
