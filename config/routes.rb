Rails.application.routes.draw do
  get 'reservations/new'

  root 'static_pages#home'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  post '/time_frames/new', to: 'time_frames#create'
  resources :users
  resources :time_frames
end
