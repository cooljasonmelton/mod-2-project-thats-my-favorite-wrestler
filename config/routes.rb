Rails.application.routes.draw do
  resources :moves, except: :destroy
  resources :wrestlers, except: :destroy 
  resources :users

  get "/login", to: "sessions#new"
  delete "/logout", to: "sessions#destroy"
  #get "/", to: "application#welcome"
  
  #resources :favorite_wrestlers
  #resources :favorite_moves
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
