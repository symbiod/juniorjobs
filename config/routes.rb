require 'sidekiq/web'

Rails.application.routes.draw do
  root 'home#index'
  resource :subscription, only: [:new, :create, :destroy]
  mount Sidekiq::Web, at: '/sidekiq'
end
