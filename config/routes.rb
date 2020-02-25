Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :instruments

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
  end

  resources :requests, only: [:show]
end
