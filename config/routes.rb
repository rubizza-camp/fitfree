Rails.application.routes.draw do

  namespace :admin do
      resources :users
      root to: "users#index"
    end
  root to: 'visitors#index'
  get 'products/:id', to: 'products#show', :as => :products
  devise_for :users
  resources :users
  resources :trainings
  resources :clients do
    get 'payments/', to: 'payments#index'
    get 'payments/create'
    post 'payments/new', to: 'payments#new'
  end
end
