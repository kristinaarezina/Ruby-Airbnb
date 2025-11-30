class CheckoutsController < ApplicationController
  require 'stripe'
  
  def create
    # Fetch the listing associated with this payment 
    @listing = Listing.find(params[:listing_id])

    # 2. Create the Stripe Checkout Session
    unit_amount_in_cents = (@listing.price * 100).to_i 

    # CORRECTED LINE: Must call create on Stripe::Checkout::Session
    session = Stripe::Checkout::Session.create({ 
      payment_method_types: ['card'],
      line_items: [{
        price_data: {
          currency: 'CAD', # You should include currency here
          product_data: {
            name: @listing.title,
          },
          unit_amount: unit_amount_in_cents,
        },
        quantity: 1,
      }],
      mode: 'payment',
      # Ensure you are using the correct URL helpers defined in your routes
      success_url: checkout_success_url(session_id: '{CHECKOUT_SESSION_ID}'),
      cancel_url: listing_url(@listing)
    })

    redirect_to session.url, allow_other_host: true
  end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    flash.now[:notice] = "Payment successful! Your booking is confirmed."
  end

  def cancel
    flash.now[:alert] = "Payment was cancelled"
  end
end