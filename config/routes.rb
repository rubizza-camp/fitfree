Rails.application.routes.draw do
  namespace :admin do
      resources :users
      root to: "users#index"
    end
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :trainings
  resources :clients do
    get 'stats', to: 'clients#stats'
    resources :metrics, shallow: true
    resources :snapshots, shallow: true
  end
end
