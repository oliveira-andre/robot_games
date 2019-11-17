# frozen_string_literal: true

require 'dotenv/load'
Dotenv.load
require Dir.pwd + '/app/services/search_games_service.rb'
require Dir.pwd + '/app/services/send_telegram_message.rb'
require Dir.pwd + '/app/jobs/application_job.rb'
require Dir.pwd + '/app/jobs/launch_telegram_bot_job.rb'

task :send_telegram_message do
  SendTelegramMessage.execute
end
