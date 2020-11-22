Rails.application.routes.draw do
  devise_for :users
  root 'genres#index'
  resources :genres, only: [:index, :new, :create, :edit, :update, :destroy] do
    resources :tasks, only: [:index, :new, :create, :edit, :update, :destroy] do
      resources :minitasks, only: [:index, :new, :create, :edit, :update]
    end
  end
end
