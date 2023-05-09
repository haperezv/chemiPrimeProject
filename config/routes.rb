Rails.application.routes.draw do
  devise_for :users
  get 'requests/index', to: 'requests#index'
  get 'requests/new', to: 'requests#new'
  post 'requests', to: 'requests#create'

  get 'jobs/index', to: 'jobs#index'
  get 'jobs/new', to: 'jobs#new'
  post 'jobs', to: 'jobs#create'

  root "home#index"
end
