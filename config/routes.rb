Rails.application.routes.draw do
  resources :users
  resources :ratings
  resources :games
  resource :session, only: [:new, :create, :destroy]

  root 'games#index'
  
  get 'signup', to: 'users#new'
end
