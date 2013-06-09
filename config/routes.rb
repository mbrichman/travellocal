Travellocal::Application.routes.draw do
  resources :recommendations


  resources :recommendation_requests
  post '/recommendation_requests/add_to_trip', 'recommendation_requests#add_to_trip'


  root to: 'Home#index'

  resources :wishlists

  post 'trip_places/create', as: 'add_to_trip'

  delete 'trip_places/:id/destroy', controller: 'trip_places', action: 'destroy', as: 'remove_from_trip'

  resources :trips

  get "home/index"

  resources :favorites

  resources :places

  resources :cities

  resources :reviews

  get 'sessions/new'
  post 'sessions/create'
  get 'sessions/destroy'
  get '/users/:id/network', controller: 'users', action: 'network', as: 'network'
  get '/users/hot', controller: 'users', action: 'hot', as: 'hot'
  get '/users/faves', controller: 'users', action: 'faves', as: 'faves'
  resources :users
  post 'connect' => 'Users#connect', as: 'connect'

end
