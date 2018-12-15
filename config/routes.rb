Rails.application.routes.draw do
  devise_for :users
  root "dashboard#index"

  resources :products, only: [:new, :create]
  resources :recipients, only: [:new, :create, :index]
  resources :survey_batches, only: :create

  get "survey/:token", to: "survey_responses#new", as: :new_survey_response
  post "survey/:token", to: "survey_responses#create"
  get "survey/:token/thanks", to: "survey_response_thanks#index", as: :survey_response_thanks
end
