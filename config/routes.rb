Rails.application.routes.draw do
  resources :items
  resources :users
  resources :categories
  resources :purchases
  root to: 'items#index'

  get '/purchases/:id/review', to: 'purchases#review'
  patch '/purchases/:id', to: 'purchases#update'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
