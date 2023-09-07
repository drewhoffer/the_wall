# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Learn more: http://github.com/javan/whenever

# Clear crontab: crontab -r
# Update cron:  whenever --update-crontab
# Update cron development: whenever --set environment='development'

require_relative './environment'

def timezoned time
  Time.zone.parse(time).utc
end

set :output, './log/cron.log'

every :day, at: timezoned('12:00 AM') do
  rake 'add_brick'
end



