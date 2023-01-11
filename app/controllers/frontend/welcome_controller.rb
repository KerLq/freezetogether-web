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

    def download_game
      controller_authorize(User)
      send_file Rails.root.join('app/assets/download/testBuild.rar'), type: 'application/rar', x_sendfile: true
    end

    def help
      controller_authorize(User)
    end

    def leaderboard
      controller_authorize(User)
    end
  end
end
