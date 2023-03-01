Rails.application.routes.draw do
  get 'recipes/index'
  get 'recipe_foods/index'
  get 'public_recipes/index'
  get 'general_shopping_lists/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :foods, only: [:index, :show, :new, :create, :destroy]
  end
end
