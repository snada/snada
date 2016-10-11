class ApplicationMailer < ActionMailer::Base
  default from: "#{ENV['PERSONAL_MAIL']}"
  layout 'mailer'
end
