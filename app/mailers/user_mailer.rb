class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def email_user(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to The Happiness Project')
  end

  def self.email_all_users(users)
    users.each do |user|
      email_user(user).deliver_now
    end
  end
end
