Rails.application.routes.draw do

  resources :posts do
    resources :comments, only: [:create]
  end

  resources :comments, only: [:destroy]

  devise_for :users
  root to: 'posts#feed'

  get 'feed', controller: :posts
end
