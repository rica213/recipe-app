Rails.application.routes.draw do
  devise_for :users
  root "recipes#public_recipes"
  
  resources :recipes, only: [:index, :show, :new, :create, :destroy] do 
    member do
      patch :toggle_public
    end
  end
  resources :foods, only: [:index, :new, :create, :destroy, :edit, :update,]
  
  get 'users/shopping_list'
  match 'public_recipes', to: "recipes#public_recipes", via: :get
end
