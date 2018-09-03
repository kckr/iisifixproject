
def load_payment_options_data
  IisifixLogger.log 'Preparing payment option data to load ...'

  PaymentOption.create type: 'card', name: 'Master Card', icon_class: 'fa fa-cc-mastercard'
  PaymentOption.create type: 'card', name: 'Visa', icon_class: 'fa fa-cc-visa'
  PaymentOption.create type: 'card', name: 'American Express', icon_class: 'fa fa-cc-amex'
  PaymentOption.create type: 'card', name: 'Diners Club', icon_class: 'fa fa-cc-diners-club'
  PaymentOption.create type: 'card', name: 'Debit Card', icon_class: 'fa fa-credit-card'
  PaymentOption.create type: 'cash', name: 'Fall', icon_class: 'fa fa-gold'
  PaymentOption.create type: 'cash', name: 'Financing and Installments', icon_class: 'fa fa-bar-chart'
  PaymentOption.create type: 'cash', name: 'Paypal', icon_class: 'fa fa-paypal'

  IisifixLogger.log 'Payment options data loaded !!!'

end
