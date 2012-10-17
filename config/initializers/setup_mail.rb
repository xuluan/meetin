if Rails.env.production?
  ActionMailer::Base.raise_delivery_errors = true

  ActionMailer::Base.smtp_settings = {
    address: "smtp.gmail.com",
    port: 587,
    domain: "nuoxu.me",
    authentication: "plain",
    enable_starttls_auto: true,
    user_name: ENV["GMAIL_ACCOUNT_NAME"],
    password: ENV["GMAIL_ACCOUNT_PASSWORD"],
  }  
end