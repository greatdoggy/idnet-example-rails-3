IdnetRails::Application.routes.draw do
  get "leaderboard/index"

  root :to => "home#index"
  resources :users, only: [:new, :create]
  match "/auth/:provider/callback", to: "sessions#create"
  match "/auth/:provider/setup", to: "sessions#setup"

  match "/signout" => "sessions#destroy", :as => :signout
  match '/private', to: "home#private_data", as: :private
  match '/site_feeds' => 'activities#site_feeds'
  resources :activities, only: [:index, :create]

  get 'app_requests' => 'app_requests#index', as: :app_requests
  get 'app_requests/callback' => 'app_requests#callback'
  get 'app_requests/delete' => 'app_requests#delete', as: :delete_request

  resources :friend_requests
  match '/callback/event', to: 'home#trace_event'

  resources :orders, except: [:edit, :update] do
    member do
      get :proceed
    end
  end

  match '/checkout', to: 'checkout#index', as: :checkout
  match '/merchant/callback', to: 'checkout#show'
  match '/friends_list', to: 'friends_list#index'

  get '/leaderboard', to: 'leaderboard#index'

  post '/leaderboard/update', to: 'leaderboard#submit'
  match '/merchant/callback', to: 'orders#callback'

end
