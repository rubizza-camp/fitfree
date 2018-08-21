Rails.application.routes.draw do
  devise_for :users
  root to: 'visitors#index'

  mount ActionCable.server => '/cable'

  namespace :admin do
    resources :users
    root to: 'users#index'
  end

  resources :clients do
    get 'stats', to: 'clients#stats'
    resources :metrics, only: [:index]
    resources :snapshots, shallow: true
    resources :messages
    post 'message/send', to: 'messages#send'
  end

  #post '/users/:id', to: 'users#create'
  post 'webhooks/:id', to: 'webhooks#callback'

  resources :users
  resources :trainings
  resources :metrics

end
