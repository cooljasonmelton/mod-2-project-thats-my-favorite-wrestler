Rails.application.routes.draw do
  resources :moves, except: :destroy
  resources :wrestlers, except: :destroy 
  resources :users

  
  #resources :favorite_wrestlers
  #resources :favorite_moves
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
