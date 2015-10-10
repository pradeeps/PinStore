class PurchaseMailer < ActionMailer::Base
  layout 'purchase_mailer'
  default from: "Kocher Handbag Store Payments <payments@kocherhandbagstore.com>"

  def purchase_receipt purchase
    @purchase = purchase
    mail to: purchase.email, subject: "Thanks for you custom!"
  end
end
