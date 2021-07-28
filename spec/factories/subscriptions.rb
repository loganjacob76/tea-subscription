FactoryBot.define do
  factory :subscription do
    title { Faker::Subscription.plan }
    price { rand(5.00..25.00) }
    frequency { rand(1..5) }
  end
end
