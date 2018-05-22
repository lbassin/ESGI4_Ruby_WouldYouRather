Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'
  #post '/vote/:id', to: 'vote#vote', alias: 'vote_vote'
  resource :votes, only: [:update]
end
