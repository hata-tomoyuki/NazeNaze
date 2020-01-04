Rails.application.routes.draw do
  root "themes#index"
  resources :posts, only: [:index, :show]
end
