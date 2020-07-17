Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/show'
  get 'posts/edit'
  get 'posts/new'

  resources :artists
  resources :artists do
    resources :albums
  end

  get 'artists/:artist_id/albums/:album_id/new' => 'posts#new'
  get 'artists/:artist_id/albums/:album_id/:id' => 'posts#show'
  post 'artists/:artist_id/albums/:album_id/create' => "posts#create"
  get 'artists/:artist_id/new' => 'posts#new'
  get 'artists/:artist_id/:id' => 'posts#show'
  post 'artists/:artist_id/create' => "posts#create"
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users
  root 'users#index'
  get 'users/index'
  get 'users/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
