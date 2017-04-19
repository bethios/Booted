class ChargesController < ApplicationController
  def new
    @stripe_btn_data = {
        key: "#{ Rails.configuration.stripe[:publishable_key]}",
        description: "Premium Membership - #{current_user.email}",
        amount: 5_00
    }
  end

  def create
    #plan = Stripe::Plan.create(
    #    :name => "Premium Plan",
    #    :id => "premium-monthly",
    #    :interval => "month",
    #    :currency => "usd",
    #    :amount => 5_00
    #)

    @amount = 5_00

    customer = Stripe::Customer.create(
      :email => current_user.email,
      :source => params[:stripeToken]
    )

    subscription = Stripe::Subscription.create(
        :customer => customer.id,
        :plan => "premium-monthly",
    )
    current_user.update_attributes(stripe_id: customer.id)
    current_user.update_attributes(stripe_subscription: subscription.id)
    current_user.update_attributes(role: 'premium')

    flash[:notice] = "Welcome to premium, #{current_user.email}! Start creating private wikis today."
    redirect_to wikis_path

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
  end

  def delete
    customer = Stripe::Customer.retrieve(current_user.stripe_id)
    subscription = Stripe::Subscription.retrieve(current_user.stripe_subscription )
    subscription.delete
    current_user.update_attributes(role: 'standard')
    redirect_to edit_user_registration_path
  end
end
