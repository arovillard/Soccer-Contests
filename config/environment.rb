# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Wcc::Application.initialize!

ActionMailer::Base.smtp_settings = {
:address              => "smtp.gmail.com",
:port                 => 587,
:domain               => 'gmail.com',
:user_name            => 'arovillard@gmail.com',
:password             => 'Pavillon2236',
:authentication => :plain,
:enable_starttls_auto => true,
:openssl_verify_mode => 'none'
}
