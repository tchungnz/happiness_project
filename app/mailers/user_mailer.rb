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

  def email_resources(user)
    @confidence = user.skills.sort { |a, b| a.confidences[-1].rating
      <=> b.confidences[-1].rating }
    @improvement = @confidence[0].name
  end

end
