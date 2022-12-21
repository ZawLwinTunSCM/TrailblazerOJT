Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  root 'welcome#index'
  resources :posts
  devise_for :users, controllers: { sessions: 'users/sessions', passwords: 'users/passwords', registrations: 'users/registrations' }

  get '/create_random', to: 'posts#create_random'
  get '/users', to: 'users#index'
end
