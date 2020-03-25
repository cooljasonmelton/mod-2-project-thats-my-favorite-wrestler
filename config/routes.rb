Rails.application.routes.draw do
  resources :moves, except: :destroy
  resources :wrestlers, except: :destroy 
  resources :users

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get 'welcome', to: 'sessions#welcome'



  
  #resources :favorite_wrestlers
  #resources :favorite_moves
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
