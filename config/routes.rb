Rails.application.routes.draw do
  
  root to: "users#new"    # <-- switch to signup page

  get '/signup' => 'users#new'

  get '/login' => 'sessions#new', as: :login
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy', as: :logout


  resources :skate_sessions do
  	resources :photos
  	resources :videos
  end
  
  resources :users

end
