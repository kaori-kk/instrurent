Rails.application.routes.draw do
  root to: 'instruments#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :instruments

  resources :users do
    collection do
      get 'dashboard#all_requests'
      get 'dashboard#my_requests'
    end
  end

  # resources :users, only: [:new, :create]

  # resources :instruments do
  #   resources :users, only: [:show]
  # end

end
