# frozen_string_literal: true

module Api
  module V1
    class SearchGamesController < ApplicationController
      before_action :load_nuuvem_games

      def index
        render json: { nuuvem_games: @nuuvem_games }
      end

      private

      def load_nuuvem_games
        @nuuvem_games = NuuvemSearchService.execute
      end
    end
  end
end
