Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "http://localhost:3000"
    
    resource "*",
      headers: :any,
      methods: %i[index post put get head options]
  end
end