# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if ENV['MAILER_DELIVERY_METHOD'] != 'smtp'
  get '/login', to: 'frontend/sessions#new'
  post '/login', to: 'frontend/sessions#create'
  get '/register', to: 'frontend/users#new'
  post '/register', to: 'frontend/users#create'

  get '/logout', to: 'frontend/sessions#destroy'
  post '/logout', to: 'frontend/sessions#destroy'

  get 'download_game_windows', to: 'frontend/welcome#download_game_windows'
  get 'download_game_linux', to: 'frontend/welcome#download_game_linux'

  namespace :api do
    namespace :v1 do
      post '/auth/login', to: 'authentications#login'
      post '/auth/validate_token', to: 'authentications#validate_token'
      post '/token/revoke', to: 'jwt_blacklists#create'
      post '/game/upload', to: 'games#upload'

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
        get :reset_password
        post :reset_password
      end
      get '/upload-image', to: 'users#upload_image'
      post '/upload-image', to: 'users#upload_image'
    end

    get '/reset_password', to: 'reset_passwords#new'
    post '/reset_password', to: 'reset_passwords#create_reset_password_link'

    resources :scores, only: %i[index show], path: '/leaderboards'
    resources :achievements, only: %i[index show]

    get '/gameinfo' => 'welcome#gameinfo'
    get '/help' => 'welcome#help'
    get '/leaderboard' => 'welcome#leaderboard'

    get '/imprint' => 'welcome#imprint'
    get '/privacy' => 'welcome#privacy'
    get '/legacy' => 'welcome#legacy'
    get '/updates' => 'welcome#updates'
    get '/user-agreement' => 'welcome#user_agreement'

    resources :sessions
    resources :news
  end

  scope module: 'backend', as: 'backend', path: 'admin' do
    root to: 'welcome#index'
    resources :users
    resources :news
    resources :characters
    resources :faqs
    resources :achievements
    resources :games
  end
end
