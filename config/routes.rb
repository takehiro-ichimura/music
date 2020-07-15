Rails.application.routes.draw do
  resources :artists
  resources :artists do
    resources :albums
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users
  root 'users#index'
  get 'users/index'
  get 'users/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
