Rails.application.routes.draw do
  root 'static_pages#home'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  post '/time_frames/new', to: 'time_frames#create'
  post '/reservations/new', to: 'reservations#create'
  resources :users
  resources :time_frames
  resources :reservations
end
