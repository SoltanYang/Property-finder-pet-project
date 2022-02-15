Rails.application.routes.draw do
  resources :properties
  resources :posts
  root to: 'public#main'

  devise_for :accounts

  # site admin routes
  get "/accounts" => 'admin#accounts', as: :accounts

  # front-end version for unregistered users
  get '/blog', to: 'posts#latest', as: :blog

  # dashboard menu routes for registered users
  get '/dashboard', to: 'dashboard#index', as: :dashboard
  get '/profiles/:id', to: 'dashboard#profile', as: :profile

  # send email message to agent route
  post '/agent/message', to: 'properties#email_agent', as: :email_agent
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
