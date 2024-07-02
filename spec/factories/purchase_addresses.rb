FactoryBot.define do
  factory :purchase_address do
    post            { '987-6543' }
    prefecture_id   { 45 }
    municipalities  { '葛城市' }
    street_address  { '9-9-9' }
    building_name   { '通天閣' }
    phone_number    { '09012345678'}
    token           { 'tok_abcdefghijk00000000000000000' }
  end
end
