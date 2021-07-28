FactoryBot.define do
  factory :tea do
    name { Faker::Tea.variety }
    description { Faker::Lorem.sentence }
    temperature { 100 }
    brew_time { rand(60..600) }
  end
end
