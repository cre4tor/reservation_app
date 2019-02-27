Rails.application.routes.draw do
  # frozen_string_literal: true
  root 'static_pages#home'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
  resources :time_frames, only: %i[new create]
  resources :reservations, only: %i[new create]
end
