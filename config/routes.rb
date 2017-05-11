Rails.application.routes.draw do
  resources :lanparties do
  	resources :games
  end
  resources :users
  resources :ratings
  resources :games
  resources :participants
  resource :session, only: [:new, :create, :destroy]



  root 'games#index'
  
  get 'signup', to: 'users#new'
  get 'signin', to: 'sessions#new'
  delete 'signout', to: 'sessions#destroy'
end
