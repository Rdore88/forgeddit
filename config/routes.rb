Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :submissions

  root controller: "submissions", action: "index"

  resources :comments

end
