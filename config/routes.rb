Rails.application.routes.draw do
  devise_for :users
  root to: "instruments#index"

  # resources :users do
  #   collection do
  #     # get 'path', to: 'CONTROLLER#ACTION'
  get 'profile/all_requests', to: 'dashboard#all_requests'
  get 'profile/my_requests', to: 'dashboard#my_requests'
  get 'profile', to: 'dashboard#profile'
      # get 'dashboard#all_requests'
      # get 'dashboard#my_requests'
      # get 'dashboard#profile'
  #   end
  # end

  resources :users, only: [:new, :create]

  resources :instruments do
    resources :users, only: [:show]
    resources :requests, only: [:new, :create]
  end

  resources :requests, only: [:show] do
    member do
      get '/accept', to: 'dashboard#accept_request'
    end
  end
end
