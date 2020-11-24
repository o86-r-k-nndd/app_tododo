Rails.application.routes.draw do
  devise_for :users
  root 'genres#index'
  # 日付
  resources :timers, only: [:index]
  get 'today' , to: 'timers#today'
  get 'tomorrow' , to: 'timers#tomorrow'
  get 'someday' , to: 'timers#someday'
  resources :genres, only: [:index, :new, :create, :edit, :update, :destroy] do
    resources :tasks, only: [:index, :new, :create, :edit, :update, :destroy] do
      resources :minitasks, only: [:index, :new, :create, :edit, :update, :destroy]
    end
  end
end
