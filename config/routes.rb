Rails.application.routes.draw do
  resources :tracks
  resources :welcome, only: [:index]
  resources :favorites, only: [:index, :create, :destroy]
  post 'tracks/:id', to: 'tracks#show'
  match 'search', to: 'tracks#search', via: [:get, :post]
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  root to: 'tracks#index'
end
