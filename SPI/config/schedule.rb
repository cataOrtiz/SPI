# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#env :GEM_PATH, ENV['GEM_PATH']
#set :bundle_command, "/usr/local/bin/bundle"
#ENV['RAILS_ENV'] = "development"
#job_type :rake,    "cd :path && :environment_variable=:environment exec rake :task --silent :output"
set :output, "log/cron.log"  #Step 1#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"]
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

#every :day, at: '17:21 pm' do
every 1.minute do
  # specify the task name as a string
  rake "actualizar_bd:consultar_ws"
  rake "calcular_indicador:consultar_task"
end

# paso 1.- wheneverized .
# paso 2.- sudo whenever --update-crontab --set environment=development
# paso 3.- sudo crontab -l
# para resetear, en caso de actualizar el cron, resetear con el comando
# de abajo y despues paso 2 y 3 
# sudo crontab -r
#
#
#
#