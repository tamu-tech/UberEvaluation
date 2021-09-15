Rails.application.routes.draw do
  get 'toppages/index'
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :create]
  resources :posts do
   resources :comments, only: [:create]
  end
     
  get "search", to: "posts#search"
end
