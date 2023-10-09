Rails.application.routes.draw do
  root "opportunities#index"

  get "/signup" => "users#new"
  post "/users" => "users#create"
  get "/login" => "sessions#new"
  post "/sessions" => "sessions#create"
  get "/logout" => "sessions#destroy"

  get "/opportunities/new" => "opportunities#new"
  post "/opportunities" => "opportunities#create"

  get "/opportunities/:id/edit" => "opportunities#edit"
  patch "/opportunities/:id" => "opportunities#update"

  get "/opportunities" => "opportunities#index"
  get "/opportunities/:id" => "opportunities#show"
  delete "/opportunities" => "opportunities#destroy"

  get "/users/:id/edit" => "users#edit"
  patch "/users/:id" => "users#update"

  get "/users/:id" => "users#show"
  post "/users" => "users#create"
  get "/users" => "users#index"

  # delete "/users" => "users#destroy"
end
