FactoryBot.define do
  factory :user_order do
    postal_code { '123-4567' }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    city { '横浜市緑区' }
    house_number { '青山1-1' }
    building_name { 'ハイツ青山' }
    tel_number { '09099999999' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
