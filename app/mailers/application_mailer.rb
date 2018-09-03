class ApplicationMailer < ActionMailer::Base
  default from: Config::EmailSender
  layout 'mailer'
end
