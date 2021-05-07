Rails.application.routes.draw do
  # get 'reservations/index'
  get 'pages/index'
  root 'sessions#new'
  resources :users
  resources :reservations
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  # post '/', to: 'sessions#new'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
