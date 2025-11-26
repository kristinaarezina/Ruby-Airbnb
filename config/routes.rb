Rails.application.routes.draw do
  resources :listings do
    get "photos", to: "listings#photos", on: :member
  end

  get "up" => "rails/health#show", as: :rails_health_check

  root "listings#index"
end