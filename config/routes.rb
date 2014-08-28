ChaseBlog::Application.routes.draw do

  get "admin/show"

  root to: 'static_pages#home'
  get '/admin' => 'admin#show'
  get '/home' => 'static_pages#home'
  get '/resources' => 'static_pages#resources'
  get '/about' => 'static_pages#about'

end
