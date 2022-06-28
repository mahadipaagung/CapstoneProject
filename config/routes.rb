Rails.application.routes.draw do
  resources :admins
  resources :pengumpuls
  resources :penyalurs, only: [:create]

  get 'penyalur/new'
  get 'penyalur/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
