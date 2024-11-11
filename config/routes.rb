Rails.application.routes.draw do
  devise_for :users
  resources :recommendations, only: [:index]
  root "recommendations#index"
end
