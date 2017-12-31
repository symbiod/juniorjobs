Rails.application.routes.draw do
  scope module: :web do
    root to: 'welcome#index'
  end
end
