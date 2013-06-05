Travellocal::Application.routes.draw do
  resources :recommendations


  resources :recommendation_requests


  root to: 'Home#index'

  resources :wishlists

  # resources :suggestions

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
  resources :users
  post 'connect' => 'Users#connect', as: 'connect'

end
