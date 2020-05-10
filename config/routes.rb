Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root :to => "todos#index", as: 'home' 

  get 'auth/auth0/callback' => 'auth0#callback'
  get 'auth/failure' => 'auth0#failure'
  
  get 'login', to: 'todos#login'
  post 'logout', to: 'logout#logout'
  resources :todos
end
