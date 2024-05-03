Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  
  resources :users, except: [:index] do
    resources :clients do
      resources :contacts, except: [:index, :show]
      resources :comments, only: [:new, :create]
    end
  end

  root to: 'sessions#index'
  
  get 'login', to: 'sessions#login', as: :login
  
  post 'authenticate', to: 'sessions#authenticate', as: :authenticate
  
  get 'logout', to: 'sessions#logout', as: :logout
end
