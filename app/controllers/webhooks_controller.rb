# app/controllers/webhooks_controller.rb
class WebhooksController < ApplicationController
  protect_from_forgery with: :null_session

  def receive
    # Process the webhook data here
    webhook_data = request.body.read
    if webhook_data.present?
      webhook_data = JSON.parse(webhook_data)
      # Process the JSON data here
      puts webhook_data
    else
      # Handle the case when the request body is empty
      head :bad_request
    end

    # You can also forward the webhook to other services here
    forward_webhook(webhook_data)

    head :ok
  end

  private

  def forward_webhook(data)
    # Implement logic to forward the webhook to other services
    # Example: Send the webhook to another API endpoint
    # You can use HTTP libraries like Faraday or HTTParty for this.
  end
end