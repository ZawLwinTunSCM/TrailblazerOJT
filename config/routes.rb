Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  root 'posts#index'

  resources :posts

  get '/create_random', to: 'posts#create_random'
end
