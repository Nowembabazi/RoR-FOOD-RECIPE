Rails.application.routes.draw do
  get 'recipe_foods/index'
  get 'general_shopping_lists/index'
  resources :recipes
  devise_for :users

  root "users#index"
  resources :users, only: [:index, :show] do
    resources :recipes, only: [:index, :show, :new, :create, :destroy]
  end

  resources :public_recipes, only: [:index]
end
