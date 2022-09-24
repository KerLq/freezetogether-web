# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: 'freezetogethergame@gmail.com'

  def registration_confirmation(user)
    @user = user
    mail(to: user.email, subject: (I18n.t 'mailer.register.subject'))
  end
end
