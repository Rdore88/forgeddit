Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :submissions

  root controller: "submissions", action: "index"

  resources :comments

  get "/sessions/new", controller: "sessions", action: "new"

  get "/users/new", controller: "users", action: "new"

  resources :users

  resource :sessions

end
