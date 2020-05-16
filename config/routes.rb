Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  # users
  resources :users, only: [:new, :create, :show]
  get '/registrate', to: 'users#new'
  post '/registrate', to: 'users#create'
  get '/profile/:id', to: 'users#show'
end
