Rails.application.routes.draw do
  root 'home#index'
  get '/signup' => 'users#new'
  get "/signin" => "sessions#new"
  post '/signin' => "sessions#create"
  get 'logout' => "sessions#destroy"


  resources :attractions
  resources :rides
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
