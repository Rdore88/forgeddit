Rails.application.routes.draw do

  resources :submissions

  root controller: "submissions", action: "index"

  resources :comments

  get "/sessions/new", controller: "sessions", action: "new"

  get "/user/new", controller: "users", action: "new"

  resources :users

  resource :sessions

end
