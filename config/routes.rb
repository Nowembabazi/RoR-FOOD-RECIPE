Rails.application.routes.draw do
  devise_for :users
  # get 'recipes/index'
  # get 'recipe_foods/index'
  # get 'public_recipes/index'
  # get 'general_shopping_lists/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'users#index'
  resources :users, only: %i[index]
  resources :foods, only: [:index, :new, :create, :destroy]
  resources :recipes, only: %i[index show create destroy] do
    resources :recipe_foods, only: %i[create destroy]
  end
  resources :recipe_foods, only: %i[create destroy]
  resources :public_recipes, only: %i[index]
  resources :general_shopping_lists, only: %i[index]
end
