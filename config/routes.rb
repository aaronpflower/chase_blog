ChaseBlog::Application.routes.draw do

  get "admins/show"

  root to: 'static_pages#home'
  get '/admin' => 'admins#show'
  get '/home' => 'static_pages#home'
  get '/resources' => 'static_pages#resources'
  get '/about' => 'static_pages#about'

end
