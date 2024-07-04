Rails.application.routes.draw do
  get 'reviews/new'
  devise_for :users

  root to: "pages#home"

  resources :planets do
    resources :bookings, only: %i[new create]
  end
  resources :bookings, only: %i[index show destroy] do
    resources :reviews, only: %i[new create]

    member do
      patch :confirm
      patch :decline
    end

  end

  resources :reviews, only: %i[destroy]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
