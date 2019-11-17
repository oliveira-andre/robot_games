# frozen_string_literal: true

module Api
  module V1
    class SearchGamesController < ApplicationController
      include Classes
      before_action :load_games
      before_action :load_nuuvem_games
      before_action :load_radugui_games

      def index
        render json: { games: @games }
      end

      private

      def load_games
        @games = []
      end

      def load_nuuvem_games
        @games << SearchGamesService.initialize(nuuvem)
      end

      def load_radugui_games
        @games << SearchGamesService.initialize(radugui)
      end
    end
  end
end
