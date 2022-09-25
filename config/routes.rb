# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/login', to: 'frontend/sessions#new'
  post '/login', to: 'frontend/sessions#create'
  get '/register', to: 'frontend/users#new'
  post '/register', to: 'frontend/users#create'

  get '/logout', to: 'frontend/sessions#destroy'
  post '/logout', to: 'frontend/sessions#destroy'

  namespace :api do
    namespace :v1 do
      post '/auth/login', to: 'authentications#login'
      post '/auth/validate_token', to: 'authentications#validate_token'
      post '/token/revoke', to: 'jwt_blacklists#create'
      resources :games
      get '/users/me', to: 'users#me'
    end
  end

  scope module: 'frontend', as: 'frontend' do
    root to: 'welcome#index'
    resources :users, only: %i[show edit update] do
      resources :scores, only: [:index] do
        resources :achievements, only: [:index]
      end
      member do
        get :confirm_email
      end
      get '/upload-image', to: 'users#upload_image'
      post '/upload-image', to: 'users#upload_image'
    end
    resources :scores, only: %i[index show], path: '/leaderboards'
    resources :achievements, only: %i[index show]

    # FRONTEND DESIGNS #
    get '/spielinfo' => 'welcome#spielinfo'
    get '/hilfe' => 'welcome#hilfe'
    get '/bestenliste' => 'welcome#bestenliste'

    resources :sessions
    resources :news
  end

  scope module: 'backend', as: 'backend', path: 'admin' do
    root to: 'welcome#index'
    resources :users
    resources :news
  end
end
