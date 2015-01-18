Rails.application.routes.draw do
  
  root to: "application#home"

  get '/signup' => 'users#new'

  get '/login' => 'sessions#new', as: :login
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy', as: :logout

  get 'users/create_session' => 'createsessions#new'

  # get 'users/join_sessions' => 'joinsessions#new'
  
  resources :users
  resources :create_sessions
  # resources :join_sessions

end
