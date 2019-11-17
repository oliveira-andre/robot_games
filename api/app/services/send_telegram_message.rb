module SendTelegramMessage
  class << self
    def execute
      LaunchTelegramBotJob.perform_now(nuuvem_games)
    end

    def nuuvem_games
      NuuvemSearchService.execute
    end
  end
end
