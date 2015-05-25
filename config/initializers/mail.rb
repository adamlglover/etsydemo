MANDRILL_API_KEY = "VNiVqp-nhFdYc3YL01pzdA"
ActionMailer::Base.smtp_settings = {
  user_name: "adamlglover85@gmail.com",
  password: MANDRILL_API_KEY,
  enable_starttls_auto: true,
  address: "smtp.mandrillapp.com",
  port: 587,
  authentication: "login"
}

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default charset: "utf-8"