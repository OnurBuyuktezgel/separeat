Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :restaurants do
    resources :reviews, only: [:create]
    resources :dishes, only: [:index, :create, :edit, :update, :destroy]
    resources :tables, only: [:create, :destroy]
  end

  resources :visits, only: [:index, :show, :new, :create] do
    resources :orders, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  end
end
