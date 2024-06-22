FactoryBot.define do
  factory :user do
    email                 {Faker::Internet.email}
    password              {"4G" + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    nickname              {Faker::Name.initials(number: 2)}
    last_name             {"松ザか"}
    first_name            {"大すケ"}
    last_name_katakana    {"マツザカ"}
    first_name_katakana   {"ダイスケ"}
    birth_day             {Faker::Date.birthday(min_age: 5, max_age: 94)}
  end
end
