Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :submissions
  resources :comments

  root controller: "submissions", action: "index"

end
