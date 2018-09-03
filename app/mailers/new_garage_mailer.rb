class NewGarageMailer < ApplicationMailer
  def notify_admin(new_garage_id)
    @new_garage = NewGarage.find(new_garage_id)
    mail to: Config::SupportEmail, subject: 'A New Garage has been added'
  end
end
