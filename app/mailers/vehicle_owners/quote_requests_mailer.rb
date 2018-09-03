module VehicleOwners
  class QuoteRequestsMailer < ApplicationMailer
    def notify_response(quote_request_id:)
      @quote_request = QuoteRequest.find(quote_request_id)
      @vehicle_owner_id = @quote_request.vehicle_owner_id

      mail to: @quote_request.vehicle_owner.email, subject: 'Response to your quote request has came!!!'
    end

    def notify_no_interest(quote_request_id:)
      @quote_request = QuoteRequest.find(quote_request_id)
      @vehicle_owner_id = @quote_request.vehicle_owner_id

      mail to: @quote_request.vehicle_owner.email, subject: 'Your request has been rejected!!!'
    end
  end
end
