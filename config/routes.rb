Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'votes#index'

  get 'dashboard', to: 'dashboard#index'

  get 'users/login', to: 'users#login'
  get 'users/logout', to: 'users#logout'
  post 'users/login', to: 'users#auth'

  resources :questions
  resources :votes, only: [:create]
  resources :users
end
