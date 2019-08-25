Rails.application.routes.draw do

  # require 'sidekiq/web'
  # require 'constraints/admin_constraint'
  # mount Sidekiq::Web => '/sidekiq', constraints: AdminConstraint

  # scope module: :web do
  #   root 'welcome#index'

  #   get '/robots.txt', to: 'seo#robots', as: :robots
  #   get '/sitemap.xml', to: 'seo#sitemap', format: 'xml', as: :sitemap

  #   get '/about', to: 'static_pages#about'
  #   get '/contributors', to: 'static_pages#contributors'
  #   get '/terms', to: 'static_pages#terms'
  #   get '/contact_us', to: 'static_pages#contact_us'

  #   resources :jobs, except: %i[index]
  #   resource :subscription, only: %i[new create destroy]

  #   namespace :admin do
  #     root 'dashboard#index'

  #     # resources :users, only: %i[index edit update destroy]
  #     # resources :subscriptions, only: %i[index]
  #     # resources :jobs, only: %i[index edit update destroy] do
  #     #   post 'approve', on: :member
  #     #   post 'not_approve', on: :member
  #     # end
  #   end
  # end
end
