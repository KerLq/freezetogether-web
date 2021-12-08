Rails.application.routes.draw do
  resources :news
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  get '/register', to: 'users#new'
  
  get '/logout', to: 'sessions#destroy'
  post '/logout', to: 'sessions#destroy'
  resources :users
end
