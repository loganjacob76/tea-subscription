# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

customer = Customer.create!(
  first_name: Faker::Name.first_name, 
  last_name: Faker::Name.last_name, 
  email: Faker::Internet.email, 
  address: Faker::Address.full_address
)

customer2 = Customer.create!(
  first_name: Faker::Name.first_name, 
  last_name: Faker::Name.last_name, 
  email: Faker::Internet.email, 
  address: Faker::Address.full_address
)

subscription = Subscription.create!(
  title: Faker::Subscription.plan,
  price: rand(5.00..25.00).round(2),
  frequency: rand(1..5)
)

subscription2 = Subscription.create!(
  title: Faker::Subscription.plan,
  price: rand(5.00..25.00).round(2),
  frequency: rand(0..4)
)

tea = Tea.create!(
  name: Faker::Tea.variety,
  description: Faker::Lorem.sentence,
  temperature: 100,
  brew_time: rand(60..600)
)

tea2 = Tea.create!(
  name: Faker::Tea.variety,
  description: Faker::Lorem.sentence,
  temperature: 100,
  brew_time: rand(60..600)
)

tea3 = Tea.create!(
  name: Faker::Tea.variety,
  description: Faker::Lorem.sentence,
  temperature: 100,
  brew_time: rand(60..600)
)

CustomerSubscription.create!(customer: customer, subscription: subscription)
CustomerSubscription.create!(customer: customer2, subscription: subscription2)

TeasSubscription.create!(tea: tea, subscription: subscription)
TeasSubscription.create!(tea: tea2, subscription: subscription)
TeasSubscription.create!(tea: tea3, subscription: subscription2)