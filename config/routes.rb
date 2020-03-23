Rails.application.routes.draw do
  resources :favorite_moves
  resources :moves
  resources :favorite_wrestlers
  resources :wrestlers
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
