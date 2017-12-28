Rails.application.routes.draw do
  root 'home#index'
  resource :subscription, only: [:new, :create, :destroy]
end