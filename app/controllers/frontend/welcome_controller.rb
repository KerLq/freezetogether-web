# frozen_string_literal: true

module Frontend
  class WelcomeController < Frontend::FrontendController
    def index
      controller_authorize(User)

      @news = News.last(3)
    end

    def spielinfo; end
    def hilfe; end
    def bestenliste; end
  end
end
