# frozen_string_literal: true

module Backend
  class NewsController < Backend::BackendController
    def index
      controller_authorize(News)

      @news = News.all
    end

    def show
      controller_authorize(News)
    end

    def new
      controller_authorize(News)

      @news = News.new
    end

    def edit
      controller_authorize(news)
    end

    def create
      controller_authorize(News)

      news = News.new(permitted_attributes(News))

      if news.save
        news.cover_image.attach(params[:news][:cover_image])
        redirect_to backend_news_path(news), flash: { success: t('.success') }
      else
        redirect_to new_backend_news_path, flash: { error: t('.failed') }
      end
    end

    def update
      controller_authorize(news)

      if news.update(permitted_attributes(news))
        redirect_to backend_news_path(news), flash: { success: t('.success') }
      else
        redirect_to new_backend_news_path, flash: { error: t('.failed') }
      end
    end

    def destroy
      controller_authorize(news)

      if news.destroy
        redirect_to backend_news_path, flash: { success: t('.success') }
      else
        redirect_to backend_news_path, flash: { error: t('.error') }
      end
    end

    private

    def news
      @news ||= News.find_by(id: params[:id])
    end
  end
end
