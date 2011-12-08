Spotted::Application.routes.draw do
  root :to => 'operator#welcome'
  get 'welcome' => 'operator#welcome'
  get "operator/welcome"

  get "signup" => "users#new"
  resources :users, :only => [:show,:index,:new,:create] do
    resources :locations, :only => [:new,:create]
    collection do
      get :current
    end
  end

  get "login" => "sessions#new"
  get "logout" => "sessions#destroy"
  get "iphone" => "sessions#iphone"
  resources :sessions, :only => [:new,:create] do
    collection do
      get :iphone
    end
  end
end
