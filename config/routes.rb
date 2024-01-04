Rails.application.routes.draw do
  devise_for :users
  root "splash#index"

  resources :categories, only: [:index, :new, :create,:destroy] do
    resources :transactions, only: [:index, :new, :create, :destroy]
  end
end
