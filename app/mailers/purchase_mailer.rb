class PurchaseMailer < ActionMailer::Base
  layout 'purchase_mailer'
  default from: "PinStore Payments <payments@pinstore.com>"

  def purchase_receipt purchase
    @purchase = purchase
    mail to: purchase.email, subject: "Thanks for you custom!"
  end
end
