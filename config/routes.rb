Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  root 'welcome#index'
  resources :posts
  devise_for :users

  get '/create_random', to: 'posts#create_random'
end
