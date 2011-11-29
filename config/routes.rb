Spotted::Application.routes.draw do
  get "signup" => "users#new"
  resources :users, :only => [:index,:new,:create]

  get "login" => "sessions#new"
  get "logout" => "sessions#destroy"
  resources :sessions, :only => [:new,:create]

  root :to => 'users#index'
end
