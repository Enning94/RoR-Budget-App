Rails.application.routes.draw do
  resources :splashes


  root to: 'splashes#index' # Default root path for unauthenticated users

  
  devise_for :users
    resources :users do
      resources :groups do
        resources :expenses
      end
    end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
 
end
