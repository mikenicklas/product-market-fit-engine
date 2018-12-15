Rails.application.routes.draw do
  devise_for :users
  root "dashboard#index"

  resources :products, only: [:new, :create]
  resources :recipients, only: [:new, :create]
end
