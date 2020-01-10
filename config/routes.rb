Rails.application.routes.draw do
  

  resources :rides
  resources :users, only: [:new, :create, :show]
  resources :attractions
  
  root 'welcome#home'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  post '/signout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
