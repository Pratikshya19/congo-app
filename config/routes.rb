Rails.application.routes.draw do
  resources :vendors
  resources :items
  resources :users
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end