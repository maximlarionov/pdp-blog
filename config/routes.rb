Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :comments

  resources :posts

  devise_for :users
  root to: 'posts#index'
end
