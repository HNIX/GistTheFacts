Rails.application.routes.draw do
  root 'homes#show'
  resources :posts, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
