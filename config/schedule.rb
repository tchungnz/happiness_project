# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

set :environment, "development"
set :output, {:error => "/Users/TC/Documents/projects/happiness_project/log/cron_error_log.log", :standard => "/Users/TC/Documents/projects/happiness_project/log/cron_log.log"}

# every 1.day do
#   runner "UserMailer.email_all_users"
# end

# every 30.minutes do
#   rake "email:all_users"
# end

# every :friday, :at => '5pm' do
#   runner "Skill.email_skills"
# end
