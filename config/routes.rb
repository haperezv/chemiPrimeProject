Rails.application.routes.draw do

  devise_for :users

  resources :requests do
    get 'get_data', to: 'requests#get_data', on: :collection
    get 'search', on: :collection
    get 'bhst_calculator', to: 'requests#bhst_calculator', on: :collection
  end

  resources :slurries

  #get 'requests/index', to: 'requests#index'
  #get 'requests/new', to: 'requests#new'
  #post 'requests', to: 'requests#create'
  #get 'requests/:id', to: 'requests#show', as: 'request'
  #get 'search', on: :collection


  get 'jobs/new', to: 'jobs#new'
  post 'jobs', to: 'jobs#create'
  get 'jobs', to: 'jobs#index'
  get 'jobs/:id', to: 'jobs#show'
  delete 'jobs/:id', to: 'jobs#destroy', as: 'job'

  get 'departaments', to: 'departaments#index'
  get 'departaments/new',  to: 'departaments#new'
  post 'departaments', to: 'departaments#create'
  get 'departaments/:id', to: 'departaments#show'
  delete 'departaments/:id', to: 'departaments#destroy', as: 'departament'

  get 'customers', to: 'customers#index'
  get 'customers/new',  to: 'customers#new'
  post 'customers', to: 'customers#create'
  get 'customers/:id', to: 'customers#show'
  delete 'customers/:id', to: 'customers#destroy', as: 'customer'

  get 'samples', to: 'samples#index'  
  get 'samples/new', to: 'samples#new'
  post 'samples', to: 'samples#create'
  get 'samples/:id', to: 'samples#show'
  delete 'samples/:id', to: 'samples#destroy', as: 'sample'

  get 'extents', to: 'extents#index'
  get 'extents/new', to: 'extents#new'
  post 'extents', to: 'extents#create'
  get 'extents/:id', to: 'extents#show'
  delete 'extents/:id', to: 'extents#destroy', as: 'extent'

  get 'aditivos', to: 'aditivos#index'
  get 'aditivos/new', to: 'aditivos#new'
  post 'aditivos', to: 'aditivos#create'
  get 'aditivos/:id', to: 'aditivos#show'
  delete 'aditivos/:id', to: 'aditivos#destroy', as: 'aditivo'

  root "home#index"
end
