class Subscription < ApplicationRecord
  has_many :customer_subscriptions, dependent: :destroy
  has_many :teas_subscriptions, dependent: :destroy
  has_many :customers, through: :customer_subscriptions
  has_many :teas, through: :teas_subscriptions

  validates :title, presence: true
  validates :price, presence: true
  validates :frequency, presence: true

  enum frequency: %i[weekly monthly quarterly half-yearly annually]
end
