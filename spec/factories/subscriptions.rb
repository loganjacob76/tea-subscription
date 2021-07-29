FactoryBot.define do
  factory :subscription do
    title { Faker::Subscription.plan }
    price { rand(5.00..25.00).round(2) }
    frequency { rand(0..4) }
  end
end
