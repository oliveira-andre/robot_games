# frozen_string_literal: true

module Api
  module V1
    class SearchGamesController < ApplicationController
      before_action :load_nuuvem_games
      before_action :send_message

      def index
        render json: { games: @nuuvem_games }
      end

      private

      def load_nuuvem_games
        @nuuvem_games = NuuvemSearchService.execute
      end

      def send_message
        LaunchTelegramBotJob.perform_later(@nuuvem_games)
      end
    end
  end
end
