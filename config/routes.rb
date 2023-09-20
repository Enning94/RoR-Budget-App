Rails.application.routes.draw do
  resources :splashes
  root "groups#index"

  devise_for :users
    resources :users do
      resources :groups do
        resources :entities
      end
    end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
 
end
