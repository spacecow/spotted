Spotted::Application.routes.draw do
  root :to => 'users#index'
  resources :users, :only => [:show,:index,:new,:create] do
    resources :locations, :only => [:new,:create]
  end

  get "signup" => "users#new"

  get "login" => "sessions#new"
  get "logout" => "sessions#destroy"
  resources :sessions, :only => [:new,:create]
end
