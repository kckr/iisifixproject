if Rails.env.development?
  # **Note**:We should use `mailcatcher` in development env to catch outgoing emails
  # Use following command to start mailcatcher server daemon
  # $ mailcatcher
  # Get out of project directory and try
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings   = { :address => 'localhost', :port => 1025 }

elsif !Rails.env.test?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings   = {
      :address              => ENV['smtp_address'],
      :port                 => ENV['smtp_port'],
      :user_name            => ENV['smtp_username'],
      :password             => ENV['smtp_password'],
      :authentication       => 'plain',
      :enable_starttls_auto => true
  }
end
