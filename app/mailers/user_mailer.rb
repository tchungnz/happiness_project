class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to The Happiness Project')
  end

  def self.email_all_users(users)
    users.each do |user|
      email(user).deliver
    end
  end

end
