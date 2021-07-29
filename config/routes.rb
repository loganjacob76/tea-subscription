Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :customer_subscriptions, only: [:create, :show]
      
      patch '/customer_subscriptions/toggle_active', to: 'customer_subscriptions#toggle_active'
    end
  end
end
