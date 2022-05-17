Rails.application.routes.draw do
  devise_for :users
  resources :recipes, only: [:index, :show, :destroy, :put]
  resources :foods, only: [:index, :new, :create, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  match 'recipes/:recipe_id' => 'recipes#toggle_public', as: :toggle_public, via: :patch

  # Defines the root path route ("/")
  # root "articles#index"

  root to: "home#index"
end
