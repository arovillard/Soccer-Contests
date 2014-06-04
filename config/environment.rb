# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Wcc::Application.initialize!

ActionMailer::Base.smtp_settings = {
:address => 'mydomain.com',
:port => 587,
:user_name => "myusername",
:password => "password",
:authentication => :plain,
:enable_starttls_auto => true,
:openssl_verify_mode => 'none'
}
