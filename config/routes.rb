Rails.application.routes.draw do
  root "visitor#index"
  get "visitor", to: "visitor#index", as: "visitor_index"

  namespace :admin do
    get "/", to: "dashboard#index"
    resources :sports
    resources :facility_owners
  end

  namespace :facility_owner do
    get "/", to: "dashboard#index"
    resources :training_grounds do
      resources :bookings
    end
    resources :players
    resources :bookings, only: [:index]
  end

  devise_for :admins
  devise_for :facility_owners

  resources :training_grounds, only: [:show] do
    resources :bookings, only: [:create]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
