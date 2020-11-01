FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials }
    email { Faker::Internet.free_email }
    password { '1111aaaa' }
    password_confirmation { '1111aaaa' }
    family_name { '山田' }
    first_name { '太郎' }
    reading_family { 'ヤマダ' }
    reading_first { 'タロウ' }
    birthday { Faker::Date.birthday }
  end
end
