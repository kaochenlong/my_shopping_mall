Rails.application.routes.draw do
  devise_for :users

  resources :products, only:[:index, :show]
  root "products#index"

  resource :cart, only:[:show, :destroy] do
    member do
      post "add", path:'add/:id'
    end
  end

  namespace :admin do
    resources :products
  end
end
