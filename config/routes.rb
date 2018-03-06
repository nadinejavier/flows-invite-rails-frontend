Rails.application.routes.draw do
  resources :invites
  resources :users
  get "/" => "users#show"
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

end
