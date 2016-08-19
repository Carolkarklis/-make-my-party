Rails.application.routes.draw do

  get "pages/home"
  root to: "pages#home"

  get 'users/show'
  get 'users/edit'

  devise_for :users, controllers: { registrations: 'registrations', omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :items, only: [ :index, :show, :new, :create, :search ] do
    resources :rents, only: [:new, :create, :destroy, :index]
    resources :reviews, only: [:new, :create, :destroy]
  end

  resources :rents, only: [:index, :show, :new, :create, :destroy, :search]
  resources :item_search

  delete '/items/:id', to: "items#destroy", as: 'delete_item'
  get '/items/:id/edit', to: "items#edit", as: 'edit_item'
  patch '/items/:id', to: "items#update"

  resources :users, only: [:show, :edit, :update]
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user

end
