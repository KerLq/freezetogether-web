class Frontend::WelcomeController < Frontend::FrontendController
	def index
		@news = News.last(3)
	end
end
