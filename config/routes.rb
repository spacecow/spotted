Spotted::Application.routes.draw do
  root :to => 'users#index'
  resources :users, :only => [:show,:index,:new,:create] do
    resources :locations, :only => [:new,:create]
    collection do
      get :current
    end
  end

  get "signup" => "users#new"

  get "login" => "sessions#new"
  get "logout" => "sessions#destroy"
  get "iphone" => "sessions#iphone"
  resources :sessions, :only => [:new,:create] do
    collection do
      get :iphone
    end
  end
end
