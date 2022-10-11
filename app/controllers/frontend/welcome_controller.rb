# frozen_string_literal: true

module Frontend
  class WelcomeController < Frontend::FrontendController
    def index
      controller_authorize(User)

      @news = News.last(3)
    end

    def spielinfo
      controller_authorize(User)
    end

    def hilfe
      controller_authorize(User)
    end

    def bestenliste
      controller_authorize(User)
    end
  end
end
