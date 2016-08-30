class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def new_skills(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to The Happiness Project')
  end

end
