FactoryBot.define do
  factory :order_address do
    post_code { '123-4567' }
    area_id { 2 }
    city { '東京都文京区' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '07099999999' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end


    
