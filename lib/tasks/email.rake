require 'dotenv/tasks'

namespace :email do
  desc 'email all users'
    task :all_users => :dotenv do
      puts "rake working"
      @users = User.all
      UserMailer.email_all_users(@users)
  end
end
