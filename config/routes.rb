Rails.application.routes.draw do
  get 'likes/index'
  root 'artists#index'
  resources :artists
  resources :artists do
    resources :albums
  end

  get 'artists/:artist_id/albums/:album_id/new' => 'posts#new'
  get 'artists/:artist_id/albums/:album_id/:id' => 'posts#show'
  post 'artists/:artist_id/albums/:album_id/create' => "posts#create"
  get 'artists/:artist_id/albums/:album_id/:id/edit' => 'posts#edit'
  post 'artists/:artist_id/albums/:album_id/:id/update' => "posts#update"
  get 'artists/:artist_id/new' => 'posts#new'
  get 'artists/:artist_id/:id' => 'posts#show'
  post 'artists/:artist_id/create' => "posts#create"
  get 'artists/:artist_id/:id/edit' => 'posts#edit'
  post 'artists/:artist_id/:id/create' => "posts#create"
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'users/:id' => 'users#show'
  get 'users/' => 'users#index'
end
