Rails.application.routes.draw do
  resources :reviews
  resources :tags
  resources :cookbooks
  resources :user_recipes
  resources :recipes
  resources :users
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#process_login'
  delete '/logout', to: 'sessions#logout'
  patch '/user_recipes/:id/save', to: "user_recipes#save", as: "save"
  patch '/user_recipes/:id/add_to_grocery_list', to: "user_recipes#add_to_grocery_list", as: "grocery"
  patch '/user_recipes/:id/remove_from_grocery_list', to: "user_recipes#remove_from_grocery_list", as: "grocery_remove"
  get '/all_recipes', to: 'recipes#all_recipes', as: "all_recipes"
  patch '/user_recipes/:id/unsave', to: "user_recipes#unsave", as: "unsave"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
