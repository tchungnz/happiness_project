class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def email_daily(user)
    @user = user
    @confidence_link_url  = 'http://example.com/login'
    @lowest_skill = find_lowest_skill(user)
    @links = Link.find_by(name: "#{@lowest_skill}").url_resources
    puts @links[1]
    puts @lowest_skill
    mail(to: @user.email, subject: 'The Bloom Team: Useful Resources')
  end

  def email_weekly(user)
    @user = user
    @con_array = []
    @skillsarray =[]
    mail(to: @user.email, subject: 'The Bloom Team: End of Week Summary')
  end

  def self.email_all_users_daily(users)
    users.each do |user|
      email_daily(user).deliver
    end
  end

  def self.email_all_users_weekly(users)
    users.each do |user|
      email_weekly(user).deliver
    end
  end

  def find_lowest_skill(user)
    @skills = user.skills
    @confidence_ratings = []
    @skills.each do |skill|
      @confidence_ratings << skill.confidences[-1].rating
    end
    return @skills[@confidence_ratings.each_with_index.min[1]].name
  end

end
