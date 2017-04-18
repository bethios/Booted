class ChargesController < ApplicationController
  def new

  end

  def create
    @amount = 500

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer => customer.id,
      :amount => @amount,
      :description => 'Premium Wiki Account',
      :currentcy => 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  #def create
  #  customer = Stripe::Customer.create(
  #      email: current_user.email,
  #      card: params[:stripeToken]
  #  )

  #  charge = Stripe::Charge.create(
  #      customer: customer.id,
  #      amount: 5_00,
  #      description: "Premium Membership - #{current_user.email}",
  #      currency: 'usd'
  #  )

  #  flash[:notice] = "Thanks for all the money, #{current_user.email}! Feel free to pay me again."
  #  current_user.role = 'premium'
  #  redirect_to user_path(current_user)

  #rescue Stripe::CardError => e
  #  flash[:alert] = e.message
  #  redirect_to root_path
  #end
  #end

  #def new
  #  @stripe_btn_data = {
  #      key: "pk_test_GztYaP7l7fjYW4rAXfn5hN4Q",
  #      description: "Premium Membership - #{current_user.email}",
  #      amount: 5_00
  #  }
  #end
end
