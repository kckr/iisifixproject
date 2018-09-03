class ContactMailer < ApplicationMailer
  def notify_admin(contact_id)
    @contact = Contact.find(contact_id)
    mail to: Config::SupportEmail, subject: 'A Message from our customer'
  end
end
