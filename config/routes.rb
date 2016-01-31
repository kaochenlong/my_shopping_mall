Rails.application.routes.draw do
  devise_for :users
  root "products#index"

  resources :products, only:[:index, :show]
  resources :orders, only:[:create]

  resource :cart, only:[:show, :destroy] do
    member do
      post "add", path:'add/:id'
      get "checkout"
    end
  end

  namespace :admin do
    resources :products
    resources :orders
  end
end
