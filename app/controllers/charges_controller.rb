class ChargesController < ActionController::Base

  def create
  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :card  => params[:stripeToken]
  )
  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => params[:price],
    :description => 'Kocher HandbagStore Stripe customer',
    :currency    => 'GBP'
  )
  purchase = Purchase.create(
    email: params[:stripeEmail],
    card: params[:stripeToken],
    amount: params[:price],
    description: charge.description,
    currency: charge.currency,
    customer_id: customer.id,
    product_id: params[:product_id],
    uuid: SecureRandom.uuid.gsub('-','')
  )

  redirect_to purchase

  rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to charges_path
  end

  # def price_in_cents(amt)
  #   amt = (amt * 100).to_i
  # end
end
