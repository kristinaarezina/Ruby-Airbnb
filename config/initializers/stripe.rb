Rails.configuration.to_prepare do 
    Stripe.api_key = Rails.application.credentials.stripe[:secret_key]
end