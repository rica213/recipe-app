Rails.application.routes.draw do
  devise_for :users
  root "recipes#index"

  resources :recipes, only: [:index, :show, :new, :create, :destroy]
  resources :foods, only: [:index, :new, :create, :destroy]

end
