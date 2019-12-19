Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  root 'static#home'
  resources :attractions
  get '/signin' => 'sessions#new', as: 'signin'
  post '/session' => 'sessions#create', as: 'session'
end
