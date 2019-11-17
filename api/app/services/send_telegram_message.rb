# frozen_string_literal: true

module SendTelegramMessage
  class << self
    def execute
      LaunchTelegramBotJob.perform_now(nuuvem_games)
    end

    def nuuvem_games
      SearchGamesService.initialize(nuuvem_params)
    end

    def nuuvem_params
      {
        env_link: ENV['nuuvem_link'],
        title: '.product-title',
        price: '.product-price--val',
        img: '.product-img img',
        link: '.product-card--wrapper',
        site: 'nuuvem'
      }
    end
  end
end
