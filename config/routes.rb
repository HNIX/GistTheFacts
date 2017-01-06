Rails.application.routes.draw do
  devise_for :users
  root 'homes#show'
  resources :users, only: [:show, :edit, :update]
  resources :posts, only: [:new, :create]
  resource :relationships, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
