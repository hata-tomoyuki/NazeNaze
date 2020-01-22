Rails.application.routes.draw do
  devise_for :users
  root "themes#index"
  get "/themes/:post_id/importants", to: 'importants#create', as: 'post_important'
  delete "/themes/:post_id/importants", to: 'importants#destroy', as: 'post_important_destroy'

  resources :themes, only: [:index, :create, :show, :destroy, :edit, :update] do
    
    resources :posts, only: [:index, :create, :destroy] 

    resources :summaries, only: [:show, :new, :create, :destroy, :edit, :update]
  end
  

end
