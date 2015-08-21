IdnetRails::Application.routes.draw do
  get "leaderboard/index"

  root :to => "home#index"
  match "/auth/:provider/callback", to: "sessions#create"
  match "/auth/:provider/setup", to: "sessions#setup"

  match "/signout" => "sessions#destroy", :as => :signout
  match '/private', to: "home#private_data", as: :private
  resources :activities, only: [:index, :create]
  resources :app_requests
  resources :friend_requests
  match '/checkout', to: 'checkout#index', as: :checkout
  match '/merchant/callback', to: 'checkout#show'
  match '/friends_list', to: 'friends_list#index'

  get '/leaderboard', to: 'leaderboard#index'

  post '/leaderboard/update', to: 'leaderboard#submit'
end
