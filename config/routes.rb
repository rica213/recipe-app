Rails.application.routes.draw do
  get 'recipe_foods/create'
  devise_for :users
  root "recipes#public_recipes"
  
  resources :recipes, only: [:index, :show, :new, :create, :destroy] do 
    member do
      patch :toggle_public
    end

    resources :recipe_foods, only: [:new, :create]
  end
  resources :foods, only: [:index, :new, :create, :destroy, :edit, :update,]
  
  get 'users/shopping_list'
  match 'public_recipes', to: "recipes#public_recipes", via: :get

  # Catch-all route for handling invalid URLs
  match "*path", to: "application#handle_routing_error", via: :all
end
