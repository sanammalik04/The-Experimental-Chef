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

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
