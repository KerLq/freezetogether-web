# frozen_string_literal: true

module Frontend
  class NewsController < Frontend::FrontendController
    def index
      controller_authorize(News)

      @news = News.all
    end

    def show
      controller_authorize(news)

      @other_news = News.limit(3).order('RANDOM()')
    end

    private

    def news
      @news ||= News.find_by(id: params[:id])
    end
  end
end
