# frozen_string_literal: true

class LaunchTelegramBotJob < ApplicationJob
  queue_as :default
  require 'telegram/bot'
  TOKEN = ENV['telegram_token']

  def perform(games)
    Telegram::Bot::Client.run(TOKEN) do |bot|
      bot.listen do |message|
        case message.text
        when '/start'
          games.each do |game|
            text = "
              Game: #{game[:title]}
                - Preço: #{game[:price]}
                - Link: #{game[:link]}
              ------------------------------------------------\n"
            bot.api.send_message(chat_id: message.chat.id, text: text)
          end
        end
      end
    end
  end
end
