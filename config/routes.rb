Rails.application.routes.draw do
  # get '/robots.txt', to: 'seo#robots'
  # get '/sitemap.xml', to: 'seo#sitemap', format: 'xml'
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  scope module: :web do
    root 'welcome#index'

    get '/about', to: 'static_pages#about'
    get '/terms', to: 'static_pages#terms'
    get '/contact_us', to: 'static_pages#contact_us'
    get '/tags', to: 'tags#index'
    resources :jobs
    resource :subscription, only: [:new, :create, :destroy]
  end

  scope module: :auth do
    get '/login', to: 'user_sessions#new', as: :login
    resources :user_sessions, only: :create
    post '/logout', to: 'user_sessions#destroy', as: :logout

    resources :users, except: [:new, :index, :show]
    get '/signup', to: 'users#new', as: :signup

    post 'oauth/callback' => 'oauths#callback'
    get 'oauth/callback' => 'oauths#callback'
    get 'oauth/:provider' => 'oauths#oauth', as: :auth_at_provider
  end
end
