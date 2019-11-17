# frozen_string_literal: true

module SearchGamesService
  class << self
    def initialize(opts = {})
      @env_link = opts.dig(:env_link)
      @title = opts.dig(:title)
      @price = opts.dig(:price)
      @img = opts.dig(:img)
      @link = opts.dig(:link)
      @site = opts.dig(:site)
      @cards = opts.dig(:cards)
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
  end
end
