class Frontend::NewsController < Frontend::FrontendController

  # GET /news or /news.json
  def index
    @news = News.all
  end

  # GET /news/1 or /news/1.json
  def show
    @news = News.find(params[:id])
    @other_news = News.limit(3).order("RANDOM()")

  end
  
end
