# frozen_string_literal: true

set :output, "#{Dir.pwd}/log/cron_log.log"

every 1.day, at: '03:00 am' do
  rake 'send_telegram_message'
end
