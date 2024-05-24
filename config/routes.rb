Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.

  # Defines the root path route ("/")
  root to: 'lists#index'
  resources :lists, only: %i[show index new create] do
    resources :bookmarks, only: %i[new create]
  end
  resources :bookmarks, only: :destroy
end
