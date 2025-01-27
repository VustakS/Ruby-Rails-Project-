Rails.application.routes.draw do
  resources :cars
  resources :categories

  root "cars#index"
end
