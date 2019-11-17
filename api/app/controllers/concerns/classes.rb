# frozen_string_literal: true

module Classes
  def nuuvem
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

  def radugui
    {
      env_link: ENV['radugui_link'],
      title: '.item-name',
      price: '.item-price strong',
      img: '.center-image .item-image',
      link: '.item-name',
      site: 'radugui_store',
      cards: '.item'
    }
  end
end
