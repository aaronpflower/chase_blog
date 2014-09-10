ChaseBlog::Application.routes.draw do

  # get "admins/show"
  resources :admins
  resources :sessions, only: [:new, :create, :destroy]

  root to: 'static_pages#home'
  get '/signin' => 'sessions#new'
  delete '/signout' => 'sessions#destroy'
  get '/admins' => 'admins#show'
  
  get '/home' => 'static_pages#home'
  get '/resources' => 'static_pages#resources'
  get '/about' => 'static_pages#about'

end