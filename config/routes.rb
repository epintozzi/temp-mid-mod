Rails.application.routes.draw do
  root to: "links#index"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :links, only: [:index, :create]
  resources :users, only: [:new, :create]


  namespace :api do
    namespace :v1 do
      resources :links, only: [:show, :update]
    end
  end
end
