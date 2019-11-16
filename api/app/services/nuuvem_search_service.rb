# frozen_string_literal: true

module NuuvemSearchService
  class << self
    LINK = 'https://www.nuuvem.com/catalog/price/promo/sort/bestselling/'\
           'sort-mode/desc'

    def execute
      cards.map { |card| hash_pattern(card) }
    end

    def page
      Mechanize.new.get(LINK)
    end

    def cards
      page.css('.product-card--grid')
    end

    def hash_pattern(card)
      {
        title: card.css('.product-title').first.content,
        price: card.css('.product-price--val').first.content.strip,
        img: card.css('.product-img img').first.attr('src'),
        link: card.css('.product-card--wrapper').first.attr('href'),
        site: 'Nuuvem'
      }
    end
  end
end
