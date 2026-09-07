Rails.application.routes.draw do
  # ruleid: avoid-default-routes
  map.connect ":controller/:action/:id"

  # ruleid: avoid-default-routes
  map.connect ":controller/:action/:id"

  # ruleid: avoid-default-routes
  map.connect ":controller/:action/:id"

  # ok: avoid-default-routes
  get '/home', to: 'pages#home'

  # ok: avoid-default-routes
  root to: 'pages#home'

  # ok: avoid-default-routes
  resources :users
end
