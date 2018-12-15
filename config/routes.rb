Rails.application.routes.draw do
  devise_for :users
  root "dashboard#index"

  resources :products, only: [:new, :create]
  resources :recipients, only: [:new, :create, :index]
  resources :survey_responses, path: "survey", only: [:new, :create]
  resources :survey_batches, only: :create
end
