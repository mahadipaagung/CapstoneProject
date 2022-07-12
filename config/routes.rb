Rails.application.routes.draw do
  get 'informasi_edukasis/index'
  get 'informasi_edukasis/show'
  get 'informasi_edukasis/create'
  get 'informasi_edukasis/update'
  get 'informasi_edukasis/destroy'
  get 'orders/index'
  get 'orders/show'
  get 'orders/create'
  get 'orders/update'
  get 'orders/destroy'
  get 'wastes/index'
  get 'wastes/show'
  get 'wastes/create'
  get 'wastes/update'
  get 'wastes/destroy'
  get 'categories/index'
  get 'categories/show'
  get 'categories/create'
  get 'categories/update'
  get 'categories/destroy'

  resources :informasi_edukasis
  resources :categories
  resources :wastes
  resources :orders
  resources :penyalurs
  devise_for :users
  resources :admins
  resources :pengumpuls
  resources :penyalurs, only: [:create]

  get 'penyalur/new'
  get 'penyalur/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
