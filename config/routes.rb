Rails.application.routes.draw do
  devise_for :users

   root to: "products#index"



   resources :products, only: [:new, :create, :index, :show, :edit, :update] do
   end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
