Rails.application.routes.draw do
  devise_for :users
  root to: 'visitors#index'

  namespace :admin do
    resources :users
    root to: 'users#index'
  end

  resources :clients do
    get 'stats', to: 'clients#stats'
    resources :metrics, only: [:index]
    resources :snapshots, shallow: true
  end

  resources :users
  resources :trainings
  resources :metrics

end
