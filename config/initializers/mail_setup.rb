ActionMailer::Base.smtp_settings = {
  :address        => "smtp.sendgrid.net",
  :port           => "25",
  :authentication => :plain,
  :user_name      => ENV['SENDGRID_USERNAME'],
  :password       => ENV['SENDGRID_PASSWORD'],
  :domain         => ENV['SENDGRID_DOMAIN']
}

ActionMailer::Base.default_url_options[:host] = "truequeliterario.com"
ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?