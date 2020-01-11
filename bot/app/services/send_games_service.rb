# frozen_string_literal: true

module SendGamesService
  class << self
    require 'dotenv/load'

    def initialize
      @env_link = nuuvem_params.dig(:env_link)
      @title = nuuvem_params.dig(:title)
      @price = nuuvem_params.dig(:price)
      @img = nuuvem_params.dig(:img)
      @link = nuuvem_params.dig(:link)
      @site = nuuvem_params.dig(:site)
      @cards = nuuvem_params.dig(:cards)
      execute
    end

    def execute
      cards.map { |card| hash_pattern(card) }
    end

    def page
      Mechanize.new.get(@env_link)
    end

    def cards
      page.css(@cards)
    end

    def hash_pattern(card)
      {
        title: card.css(@title).first.content.strip,
        price: card.css(@price).first.content.strip,
        img: card.css(@img).first.attr('src'),
        link: card.css(@link).first.attr('href'),
        site: @site
      }
    end

    def nuuvem_params
      {
        env_link: ENV['nuuvem_link'],
        title: '.product-title',
        price: '.product-price--val',
        img: '.product-img img',
        link: '.product-card--wrapper',
        site: 'nuuvem',
        cards: '.product-card--grid'
      }
    end
  end
end
