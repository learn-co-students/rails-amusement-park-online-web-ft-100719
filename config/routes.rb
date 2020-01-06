Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :show]

  root to: 'users#new'

  get 'signin', to: 'sessions#new'

  post 'signin', to: 'sessions#create'

  delete 'logout', to: 'sessions#destroy'

  resources :attractions, only: [:new, :create, :edit, :update, :index, :show]

  resources :rides, only: [:create]
end
