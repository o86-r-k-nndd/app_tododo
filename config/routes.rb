Rails.application.routes.draw do
  devise_for :users
  root 'genres#index'
  resources :genres, only: [:index, :new, :create, :edit, :update, :destroy]
end
