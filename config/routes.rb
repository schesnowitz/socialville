Rails.application.routes.draw do

  devise_for :users
  resources :statuses do
    resources :messages
  end
  root to: 'statuses#index'
    # Making Friends ---------------------
  resources :users, only: [:index, :show]    
   resources :friendships, only: [:create, :destroy, :accept] do 
    member do 
      put :accept
    end
  end
    # Making Friends ---------------------
  mount ActionCable.server => '/cable'
end