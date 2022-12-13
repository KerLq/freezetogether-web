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

    def imprint
      controller_authorize(User)
    end

    def legacy
      controller_authorize(User)
    end

    def updates
      controller_authorize(User)
    end

    def user_agreement
      controller_authorize(User)
    end

    def privacy
      controller_authorize(User)
    end

    def download
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
