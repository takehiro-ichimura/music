Rails.application.routes.draw do
  root 'homes#top'
  get 'terms' => 'homes#terms'
  get 'contact' => 'homes#contact'
  get 'aboutus' => 'homes#aboutus'
  get "artists/search" => "artists#search"
  resources :artists
  resources :artists do
    resources :albums
  end
  get 'likes/index'

  post 'artists/:artist_id/albums/:album_id/create' => "posts#create"
  post 'artists/:artist_id/albums/:album_id/:id/like' => "likes#create"
  post 'artists/:artist_id/albums/:album_id/:id/unlike' => "likes#destroy"
  post 'artists/:artist_id/albums/:album_id/:id/stock' => "stocks#create"
  post 'artists/:artist_id/albums/:album_id/:id/unstock' => "stocks#destroy"
  get 'artists/:artist_id/albums/:album_id/:id/edit' => 'posts#edit'
  post 'artists/:artist_id/albums/:album_id/:id/update' => "posts#update"
  post 'artists/:artist_id/albums/:album_id/:id/comment' => "posts#comment"
  post 'artists/:artist_id/albums/:album_id/:id/destroy' => "posts#destroy"
  get 'artists/:artist_id/albums/:album_id/new' => 'posts#new'
  get 'artists/:artist_id/albums/:album_id/:id' => 'posts#show'
  get 'artists/:artist_id/new' => 'posts#new'
  post 'artists/:artist_id/create' => "posts#create"
  get 'artists/:artist_id/:id' => 'posts#show'
  get 'artists/:artist_id/:id/edit' => 'posts#edit'
  post 'artists/:artist_id/:id/update' => "posts#update"
  post 'artists/:artist_id/:id/destroy' => "posts#destroy"
  post 'artists/:artist_id/:id/like' => 'likes#create'
  post 'artists/:artist_id/:id/unlike' => 'likes#destroy'
  post 'artists/:artist_id/:id/stock' => 'stocks#create'
  post 'artists/:artist_id/:id/unstock' => 'stocks#destroy'
  post 'artists/:artist_id/:id/comment' => 'likes#comment'
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'users/profile_edit' => 'users#profile_edit'
  post 'users/profile_update' => 'users#profile_update'
  get 'users/:id' => 'users#show'
  get 'users/' => 'users#index'
end
