Rails.application.routes.draw do
  
  root to: 'frontend/frontend#index'
  
  resources :news
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/login', to: 'frontend/sessions#login'
  post '/login', to: 'frontend/sessions#create'
  get '/register', to: 'frontend/users#new'
  
  get '/logout', to: 'frontend/sessions#destroy'
  post '/logout', to: 'frontend/sessions#destroy'
  
  scope module: 'frontend' do
    resources :users
  end
end
