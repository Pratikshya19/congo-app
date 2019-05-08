Rails.application.routes.draw do
  resources :vendors
  resources :items
  resources :users
  resources :categories
  resources :purchases
  root to: 'items#index'

  get '/purchases/:id/review', to: 'purchases#review'
  patch '/purchases/:id', to: 'purchases#update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
