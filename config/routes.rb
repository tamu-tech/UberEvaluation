Rails.application.routes.draw do
  get 'toppages/index'
  get 'toppages/explanation'
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :create] 
  resources :posts do
    resources :comments, only: [:create]
  end
  get "search", to: "posts#search"
end
