class Frontend::NewsController < Frontend::FrontendController
  before_action :set_news, only: %i[ show ]

  # GET /news or /news.json
  def index
    @news = News.all
  end

  # GET /news/1 or /news/1.json
  def show
    @news = News.find(params[:id])
  end

  def set_news
    @news = News.find(params[:id])
  end
    # Only allow a list of trusted parameters through.
    def news_params
      params.require(:news).permit(:cover_image, :content, :description)
    end
end
