Rails.application.routes.draw do
  resources :todos
  
  get "up" => "rails/health#show", as: :rails_health_check

  get 'hello', to: 'todos#hello'
  get 'new_todo', to: 'todos#new'
  
  root 'pages#home'

  resources :users, only: [:new, :create, :edit, :update]
  get 'signup', to: 'users#new', as: :signup
  get 'profile', to: 'users#edit', as: :profile
  patch 'profile', to: 'users#update'

  get  'login',  to: 'sessions#new',     as: :login
  post 'login',  to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: :logout
end