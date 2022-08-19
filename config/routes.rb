Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "lists#index"
  resources :lists, only: [:new, :create, :show, :destroy] do
    resources :bookmarks, only: [ :new, :create]
  end
  resources :bookmarks, only: [ :destroy ]
  # Defines the root path route ("/")

end
