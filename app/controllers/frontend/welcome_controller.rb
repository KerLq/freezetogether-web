# frozen_string_literal: true

module Frontend
  class WelcomeController < Frontend::FrontendController
    def index
      controller_authorize(User)

      @news = News.last(3)
    end

    def gameinfo
      controller_authorize(User)
    end

    def help
      controller_authorize(User)
    end

    def leaderboard
      controller_authorize(User)
    end
  end
end
