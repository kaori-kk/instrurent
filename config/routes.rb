Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :instruments

  # resources :users do
  #   collection do
  #     get 'dashboard#all_requests'
  #     get 'dashboard#my_requests'
  #   end
  # end

  # resources :users, only: [:new, :create]

  # resources :instruments do
  #   resources :users, only: [:show]
  # end

end
