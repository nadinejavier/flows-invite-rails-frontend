Rails.application.routes.draw do
  resources :invites
  resources :users
  root "users#new"
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

end
