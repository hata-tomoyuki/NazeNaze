Rails.application.routes.draw do
  devise_for :users
  root "themes#index"

  resources :themes, only: [:index, :create, :show, :destroy] do
    resources :posts, only: [:index, :create, :destroy]
  end

end
