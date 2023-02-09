FactoryBot.define do
  factory :item do
    item_name             {"テックキャンプ"}
    explain               {Faker::Lorem.sentence}
    category_id           {5}
    state_id              {2}
    shipping_id           {3}
    area_id               {27}
    number_of_day_id      {3}
    price                 {6666}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('spec/images/test.jpg'), filename: 'test.jpg')
    end

  end
end
