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

  resources :cart, only: [:show, :edit, :update]
  post '/cart', to: 'carts#add_to_cart', as: :add_to_cart
  post '/add', to: 'sessions#add_cart_product', as: :add_product

  get 'carts/:id/checkout', to: 'carts#checkout', as: :checkout
  post 'carts/:id/checkout', to: 'carts#finalize'

  get 'order/:id', to: 'carts#order_details', as: :order

end
