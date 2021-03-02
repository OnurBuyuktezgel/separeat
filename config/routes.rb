Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :restaurants do
    resources :reviews, only: [:create, :new, :index]
    resources :dishes, only: [:index, :create, :edit, :update, :destroy]
    resources :tables, only: [:create, :destroy]
  end

  resources :tables, only: [] do
    member do
      get :qr_code
    end
  end

  get 'qr-code-reader', to: 'qr_code_readers#index'

  resources :visits, only: [:index, :show, :new, :create, :update] do
    resources :orders, only: [:index, :show, :new, :create, :edit, :update]
    post 'orders/:id/add' => "orders#add_quantity", as: "order_add"
    post 'orders/:id/reduce' => "orders#reduce_quantity", as: "order_reduce"
    # post 'orders' => "orders#create"
    # get 'orders/:id' => "orders#show", as: "order"
    # delete 'orders/:id' => "orders#destroy"
  end

  resources :orders, only: [:destroy]
end
