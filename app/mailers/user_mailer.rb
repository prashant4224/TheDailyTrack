class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.profile_email.subject
  #
  def profile_email(user)
    @user = user
    @url  = 'http://localhost:3000'
    mail(to: @user.email, subject: 'Welcome to CloudTrendz')
  end
end
