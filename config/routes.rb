Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Include routes from separate files
  Dir[Rails.root.join('config/routes/*.rb')].each { |file| instance_eval(File.read(file)) }
  
  resources :users, except: [:index] do
    resources :clients do
      resources :contacts, except: [:index, :show]
      resources :comments, only: [:new, :create]
    end
  end
end
