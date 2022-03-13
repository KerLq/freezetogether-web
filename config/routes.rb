Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/login', to: 'frontend/sessions#login'
  post '/login', to: 'frontend/sessions#create'
  get '/register', to: 'frontend/users#new'
  post '/register', to: 'frontend/users#create'

  get '/logout', to: 'frontend/sessions#destroy'
  post '/logout', to: 'frontend/sessions#destroy'

  scope module: 'frontend', as: 'frontend' do
    root to: "welcome#index"
    resources :users, only: [:show, :edit] do
      resources :achievements, only: [:index, :show]
      member do
        get :confirm_email
      end
    end
    resources :scores, only: [:index, :show], path: '/leaderboards'
    
    
    resources :sessions
    resources :news
    resources :scores, only: [:index, :show]
    resources :achievements, only: [:index, :show]
  end

  scope module: 'backend', as: 'backend', path: 'admin' do
    root to: "welcome#index"
    resources :users
    resources :news
  end
end
