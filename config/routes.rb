Rails.application.routes.draw do

  devise_for :users
  resources :statuses
  resources :users, only: [:index, :show]
  root to: 'statuses#index'
   resources :friendships, only: [:create, :destroy, :accept] do 
    member do 
      put :accept
    end
  end
  
end
