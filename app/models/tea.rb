class Tea < ApplicationRecord
  has_many :teas_subscriptions, dependent: :destroy
  has_many :subscriptions, through: :teas_subscriptions
  has_many :customers, through: :subscriptions

  validates :name, presence: true
  validates :description, presence: true
  validates :temperature, presence: true
  validates :brew_time, presence: true
end
