Rails.application.routes.draw do

  root "sessions#new"

  resources :users
  resources :events do
  	post "suscribe", on: :member
  end

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

end
