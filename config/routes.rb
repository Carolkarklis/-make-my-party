Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :items, only: [ :index, :show, :new, :create, :search ] do
    resources :rents, only: [:new, :create, :destroy, :index]
    resources :reviews, only: [:new, :create, :destroy]
  end

  resources :rents, only: [:index, :show, :new, :create, :destroy, :search]
  resources :item_search

  # delete '/items/:id', to: "items#destroy", as: 'delete_item'
  # get '/items/:id/edit', to: "items#edit", as: 'edit_item'
  # patch '/items/:id', to: "items#update"

  # match '/item_search/index', :to => 'item_search#index', as: 'item_search', via => 'GET'

  root to: "items#index"



  # root to: 'pages#home'
  # root to: "home#index"

  resources :items
end
