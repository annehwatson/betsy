Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#root'

  resources :products
  resources :users

  resources :categories do
    resources :products, only: [:index]
  end

  get '/login', to: 'sessions#new', as: 'login'
  delete '/logout', to: 'sessions#logout', as: 'logout'
  get "/auth/:provider/callback", to: "sessions#create", as: 'auth_callback'
end
