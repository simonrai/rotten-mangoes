RottenMangoes::Application.routes.draw do

  resources :movies do
    resources :reviews, only: [:new, :create]
  end
  
  namespace :admin do
    resources :users, only: [:index, :destroy, :show]
  end
    
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  
  root to: 'movies#index'

end