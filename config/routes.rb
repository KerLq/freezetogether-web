Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/login', to: 'frontend/sessions#login'
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
    root to: "welcome#index"
    resources :users, only: [:show, :edit, :update] do
      resources :scores, only: [:index] do
        resources :achievements, only: [:index]
      end
      member do
        get :confirm_email
      end
      get '/upload-image', to: 'users#upload_image'
      post '/upload-image', to: 'users#upload_image'

    end
    resources :scores, only: [:index, :show], path: '/leaderboards'
    resources :achievements, only: [:index, :show]

    get '/spielinfo' => 'welcome#spielinfo'
    get '/hilfe' => 'welcome#hilfe'

    resources :sessions
    resources :news
  end

  scope module: 'backend', as: 'backend', path: 'admin' do
    root to: "welcome#index"
    resources :users
    resources :news
  end
end
