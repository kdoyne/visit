Rails.application.routes.draw do

  resources :users, only: [:new, :create, :destroy]

  resources :visitors, only: [:index, :new, :create]

  root "visitors#new"

  get "/login", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  delete "/sessions", to: "sessions#delete"

end
