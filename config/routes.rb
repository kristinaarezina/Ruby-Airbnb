## config/routes.rb - Consolidated Version

Rails.application.routes.draw do
  # Devise must only be defined once
  devise_for :users
  
  # Main Listings Resources
  resources :listings do
    get "photos", to: "listings#photos", on: :member
    
    # 1. Nested Checkouts resource (for the POST to create session)
    resources :checkouts, only: [:create]
    
    # 2. Nested File Uploads resource (for Active Storage)
    resources :file_uploads, only: [:create]
  end

  # Stripe Checkout Redirection Routes
  get 'checkout/success', to: 'checkouts#success', as: :checkout_success 
  get 'checkout/cancel', to: 'checkouts#cancel', as: :checkout_cancel
  
  # Singular Resources
  resource :settings, only: [:show, :create]
  resource :owner_signup, only: [:show], controller: :owner_signup

  # Health Check and Root
  get "up" => "rails/health#show", as: :rails_health_check

  root "listings#index"
end