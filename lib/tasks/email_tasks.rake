require 'dotenv/tasks'

namespace :email do
  desc 'email all users'
    task :all_users => :dotenv do
      @users = User.all
      UserMailer.email_all_users(@users)
  end
end
