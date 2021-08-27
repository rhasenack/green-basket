Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :baskets, only: [:index, :show, :create, :new] do
    resources :orders, only: [:create, :new]
    resources :reviews, only: [ :new, :create ]
    resources :favourites, only: [:new, :create]
   end

  get 'favourites', to: 'baskets#favourites'
  resources :favourites, only: [:destroy]

  resources :orders, only: [:index] do
    member do
      get :accept
      get :decline
      get :cancel
    end
  end
  # get 'orders/:order_id/accept', to: 'orders#accept', as: :accept
  # get 'orders/:order_id/decline', to: 'orders#decline', as: :decline
  # get 'orders/:order_id/cancel', to: 'orders#cancel', as: :cancel
end
