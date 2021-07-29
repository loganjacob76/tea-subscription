class CustomerSubscriptionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :active
  belongs_to :customer
  belongs_to :subscription
end
