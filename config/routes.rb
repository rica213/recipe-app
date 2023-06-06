Rails.application.routes.draw do
  root "recipes#index"

  resources :recipes, only: [:index, :show, :new, :create, :destroy]
  resources :foods, only: [:index, :new, :create, :destroy]

end
