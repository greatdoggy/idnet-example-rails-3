IdnetRails::Application.routes.draw do
  root :to => "home#index"
  match "/auth/:provider/callback", to: "sessions#create"
  match "/auth/:provider/setup", to: "sessions#setup"

  match "/signout" => "sessions#destroy", :as => :signout
  match '/private', to: "home#private_data", as: :private
  match '/site_feeds' => 'activities#site_feeds'
  resources :activities, only: [:index, :create]
  resources :app_requests do
    collection do
      get 'callback'
    end
  end

  resources :friend_requests

  match '/checkout', to: 'checkout#index', as: :checkout
  match '/merchant/callback', to: 'checkout#show'
end
