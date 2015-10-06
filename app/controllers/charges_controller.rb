class ChargesController < ActionController::Base


  def create
  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :card  => params[:stripeToken]
  )
  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => params[:price],
    :description => 'PinStore Stripe customer',
    :currency    => 'usd'
  )
  rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to charges_path
  end

  # def price_in_cents(amt)
  #   amt = (amt * 100).to_i
  # end
end
