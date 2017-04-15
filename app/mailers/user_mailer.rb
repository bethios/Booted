class UserMailer < Devise::Mailer
  helper :application
  include Devise::Controllers::UrlHelpers
  default template_path: 'devise/mailer'

  default from: "bethios@gmail.com"

  def confirmation_instructions(user)
    headers["Message-ID"] = "<user/#{user.id}@your-app-name.example>"
    headers["In-Reply-To"] = "<user/#{user.id}@your-app-name.example>"
    headers["References"] = "<user/#{user.id}@your-app-name.example>"

    @user = user

    mail(to: user.email, subject: "Confirm your blocipedia account")

  end
end
