Rails.application.routes.draw do
  root "visitor#index"

  namespace :admin do
    get '/', to: 'dashboard#index'
    resources :sports
  end

  namespace :facility_owner do
    get '/', to: 'dashboard#index'
    resources :training_grounds
  end

  devise_for :admins
  devise_for :facility_owners
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
