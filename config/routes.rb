Rails.application.routes.draw do
  # get 'reservations/index'
  get '/pages', to: 'pages#index'
  root 'sessions#new'
  resources :users
  resources :reservations
  # post 'reservations/:id/edit', to: 'reservations#edit'
  # get 'reservations/:id/delete', to: 'reservations#delete'
  # get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/logout', to: "sessions#destroy"
  # post '/', to: 'sessions#new'
  
  resources :manages
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
