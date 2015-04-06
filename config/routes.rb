Rails.application.routes.draw do

  resources :posts

  resources :comments

  devise_for :users
  root to: 'posts#feed'

  get 'feed', controller: :posts
end
