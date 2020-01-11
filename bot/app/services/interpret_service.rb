# frozen_string_literal: true

class InterpretService
  require 'telegram/bot'
  require 'dotenv/load'
  TOKEN = ENV['telegram_token']

  def self.call
    Telegram::Bot::Client.run(TOKEN) do |bot|
      puts 'Telegram bot started'

      bot.listen do |message|
        case message.text
        when '/start'
          text = 'O que você quer filho da puta? os jogos estão em: /games'
        when '/games'
          SendGamesService.initialize.each do |game|
            text = "
            Game: #{game[:title]}
              - Preço: #{game[:price]}
              - Link: #{game[:link]}
            ------------------------------------------------\n"
            bot.api.send_message(chat_id: message.chat.id, text: text)
          end
        when '/help'
          text = 'Precisa de ajuda é otário?'
        else
          text = 'Não entendi nada filho da puta'
        end
        unless message.text == '/games'
          bot.api.send_message(chat_id: message.chat.id, text: text)
        end
      end
    end
  end
end
