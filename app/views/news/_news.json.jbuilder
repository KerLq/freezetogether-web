json.extract! news, :id, :cover_image, :content, :description, :created_at, :updated_at
json.url news_url(news, format: :json)
