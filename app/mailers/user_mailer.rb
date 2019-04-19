class UserMailer < ApplicationMailer
  def account_activation user
    @user = user
    mail to: user.email, subject: t("mail.account")
  end

  def password_reset user
    @greeting = t "mail.hi"

    mail to: user.email, subject: t("mail.pass_reset")
  end
end
