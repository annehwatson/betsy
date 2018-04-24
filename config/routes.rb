Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#root'

  resources :products
  get '/products/:id/reviews/new', to: 'reviews#new', as: 'new_product_review'
  resources :users
  resources :products do
    resources :users, only: [:index]
  end

  resources :reviews, only: [:new, :create]

  resources :categories do
    resources :products, only: [:index]
  end

  get '/login', to: 'sessions#new', as: 'login'
  get "/auth/:provider/callback", to: "sessions#create", as: 'auth_callback'
  delete '/logout', to: 'sessions#logout', as: 'logout'

  resources :carts, only: [:show, :edit, :update]
  post '/carts', to: 'carts#add_to_cart', as: :add_to_cart
  post '/add', to: 'sessions#add_cart_product', as: :add_product

  get 'carts/:id/checkout', to: 'carts#checkout', as: :checkout
  post 'carts/:id/checkout', to: 'carts#finalize'

  get 'order/:id', to: 'carts#order_details', as: :order


end