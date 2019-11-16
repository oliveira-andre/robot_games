# frozen_string_literal: true
require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  namespace :api do
    namespace :v1 do
      resources :search_games, only: :index
    end
  end
end
