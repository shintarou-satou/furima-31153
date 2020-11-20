Rails.application.routes.draw do
  devise_for :users

   root to: "products#index"

   resources :products, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
       resources :orders, only: [:new, :create, :index] 
   end
end
