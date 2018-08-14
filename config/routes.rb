Rails.application.routes.draw do
  namespace :admin do
      resources :users
      root to: "users#index"
    end
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :trainings
  resources :clients
  resources :calendar, only: [:index, :download]
  get 'download', to: 'calendar#download'
  resources :exercise_types, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :exercises
  resources :kits
  post 'newkitform', to: 'kits#new_kit_form'
  post 'newexerciseform', to: 'exercises#new_exercise_form'
end
