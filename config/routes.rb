Rails.application.routes.draw do

  devise_for :users

  get 'requests/index', to: 'requests#index'
  get 'requests/new', to: 'requests#new'
  post 'requests', to: 'requests#create'
  get 'requests/:id', to: 'requests#show', as: 'request'

  get 'jobs/index', to: 'jobs#index'
  get 'jobs/new', to: 'jobs#new'
  post 'jobs', to: 'jobs#create'

  get 'departaments/new',  to: 'departaments#new'
  post 'departaments', to: 'departaments#create'

  get 'customers/new',  to: 'customers#new'
  post 'customers', to: 'customers#create'

  get 'samples/new', to: 'samples#new'
  post 'samples', to: 'samples#create'

  get 'extents/new', to: 'extents#new'
  post 'extents', to: 'extents#create'

  root "home#index"
end
