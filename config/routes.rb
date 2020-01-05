Rails.application.routes.draw do
  root "themes#index"
  resources :themes, only: [:index, :create]
end
