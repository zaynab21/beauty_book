Rails.application.routes.draw do
  devise_for :moderators, path: 'moderators'
  devise_for :users,  path: 'users'
  root to: 'pages#home'
  resources :recipes do
    resources :ingredient_recipes
    resources :reviews, only: [:create]
  end
  get '/mypage', to: 'pages#mypage'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :moderators do
    resources :recipes
    resources :tags,  only: [:new, :create, :edit, :update]
  end
end
