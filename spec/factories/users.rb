FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {'神谷'}
    last_name             {'倖汰'}
    first_kana            {'カミヤ'}
    last_kana             {'コウタ'}
    birth_day             {Faker::Date.birthday(min_age: 0, max_age: 100)}
  end
end