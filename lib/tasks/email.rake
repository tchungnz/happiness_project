require 'dotenv/tasks'

namespace :email do
  desc 'email all users'
    task :all_users_daily => [:environment, :dotenv] do
      puts "rake start"
      @users = User.all
      UserMailer.email_all_users_daily(@users)
      puts "rake end"
  end
end

namespace :email do
  desc 'email all users'
    task :all_users_weekly => [:environment, :dotenv] do
      puts "rake start"
      @users = User.all
      UserMailer.email_all_users_weekly(@users)
      puts "rake end"
  end
end

namespace :db do
  desc "Sequentially clears out the models I don't care about"
  task :reset_links_model => [:environment, :dotenv] do
    Link.destroy_all
  end
end
