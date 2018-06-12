Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'votes#index'
  resources :questions
  resources :votes, only: [:create]
  resources :users
end
