Rails.application.routes.draw do
  resources :moves, except: :destroy
  resources :wrestlers, except: :destroy 
  resources :users
  resources :favorite_moves, only: [:index, :new, :create]


  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get '/areyousure', to: 'users#areyousure'
  delete '/logout', to: 'sessions#destroy'
  root 'sessions#welcome'



  
  #resources :favorite_wrestlers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
