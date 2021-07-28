class Api::V1::CustomerSubscriptionsController < ApplicationController
  def show
    
  end

  def create
    cust_sub = CustomerSubscription.find_or_initialize_by(customer_subscription_params)

    if cust_sub.save && params[:customer_id].present? && params[:subscription_id].present?
      render json: CustomerSubscriptionSerializer.new(cust_sub)
    else
      render json: { errors: 'Existing customer ID and subscription ID must be present', status: 400 }, status: :bad_request
    end
  end

  def toggle_active
    if params[:customer_id].present? && params[:subscription_id].present?
      cust_sub = CustomerSubscription.find_by(customer_subscription_params)

      cust_sub.toggle!(:active)
      
      render json: CustomerSubscriptionSerializer.new(cust_sub)
    else
      render json: { errors: 'Existing customer ID and subscription ID must be present', status: 400 }, status: :bad_request
    end
  end

  private
  
  def customer_subscription_params
    params.permit(:customer_id, :subscription_id)
  end
end