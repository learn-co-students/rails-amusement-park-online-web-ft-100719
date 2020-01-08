Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'users#new'

  resources :users, only: [:new, :show, :create, :destroy, :update]

  get '/signup', controller: 'users', action: 'new'
  get '/signin', controller: 'users', action: 'signin'
  post '/signin', controller: 'users', action: 'signin_post'

  resources :attractions, only: [:index, :show, :new, :create, :edit, :update] do 
    post '/ride', controller: 'attractions', action: 'ride'
  end 

end
