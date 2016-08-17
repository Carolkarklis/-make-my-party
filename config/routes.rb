Rails.application.routes.draw do
  devise_for :users

  resources :items, only: [ :index, :show, :new, :create ] do
    resources :rents, only: [:new, :create, :destroy, :index]
    resources :reviews, only: [:new, :create, :destroy]
  end

  resources :rents, only: [:index, :show, :new, :create, :destroy]


  delete '/items/:id', to: "items#destroy", as: 'delete_item'
  get '/items/:id/edit', to: "items#edit", as: 'edit_item'
  patch '/items/:id', to: "items#update"

  # delete '/doses/:id', to: "doses#destroy", as: 'delete_dose'

  root to: "items#index"



  # root to: 'pages#home'
  # root to: "home#index"

  resources :items
end
