class Frontend::WelcomeController < Frontend::FrontendController
    def index
        @news = News.last(3)
    end

    def spielinfo; end
    def hilfe; end
    def bestenliste; end
end
