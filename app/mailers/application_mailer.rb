class ApplicationMailer < ActionMailer::Base
  default from: ENV["NAME_GMAIL"]
  layout "mailer"
end
