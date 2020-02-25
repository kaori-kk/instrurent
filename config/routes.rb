Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :instruments

  resources :users do
    collection do
      # get 'path', to: 'CONTROLLER#ACTION'
      get 'path', to: 'dashboards#all_requests'
      get 'path', to: 'dashboards#my_requests'
      get 'path', to: 'dashboards#profile'
      # get 'dashboard#all_requests'
      # get 'dashboard#my_requests'
      # get 'dashboard#profile'
    end
  end

  resources :users, only: [:new, :create]

  resources :instruments do
    resources :users, only: [:show]
  end

  resources :requests, only: [:show]
end
