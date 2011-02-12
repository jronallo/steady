# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Steady::Application.initialize!

Steady::Application.configure do
  
  config.action_mailer.delivery_method = :smtp
  # $ export GMAIL_SMTP_USER=username@gmail.com
  # $ export GMAIL_SMTP_PASSWORD=yourpassword

  # heroku config:add GMAIL_SMTP_USER=username@gmail.com
  # heroku config:add GMAIL_SMTP_PASSWORD=yourpassword
  config.action_mailer.smtp_settings = {
    :address              => "smtp.gmail.com",
    :port                 => 587,
    :domain               => 'steady.heroku.com',
    :user_name            => ENV['GMAIL_SMTP_USER'],
    :password             => ENV['GMAIL_SMTP_PASSWORD'],
    :authentication       => 'plain',
    :enable_starttls_auto => true  }
    
end
