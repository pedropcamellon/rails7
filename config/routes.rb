Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Include routes from separate files
  draw(:health_routes) # Will load another route file located in `config/routes/health_routes.rb`
  draw(:sessions_routes)
  
  resources :users, except: [:index] do
    resources :clients do
      resources :contacts, except: [:index, :show]
      resources :comments, only: [:new, :create]
    end
  end
end
