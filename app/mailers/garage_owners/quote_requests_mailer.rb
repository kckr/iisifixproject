module GarageOwners
  class QuoteRequestsMailer < ApplicationMailer
    def notify_new_request(quote_request_id:)
      @quote_request   = QuoteRequest.find(quote_request_id)
      @garage_owner_id = @quote_request.garage_owner.id rescue 9999
      mail to: @quote_request.garage.email, subject: 'New Quote Request arrived just now !!!'
    end

    def notify_cancellation(quote_request_id:, garage_owner_id: nil)
      @quote_request   = QuoteRequest.find(quote_request_id)
      @garage_owner_id = @quote_request.garage_owner.id rescue 9999

      mail to: @quote_request.garage.email, subject: 'Quote Request has been cancelled/withdrawn'
    end

    def notify_acceptance(quote_request_id:, garage_owner_id: nil)
      @quote_request   = QuoteRequest.find(quote_request_id)
      @garage_owner_id = @quote_request.garage_owner.id rescue 9999

      mail to: @quote_request.garage.email, subject: 'Quote Request has been accepted !!!'
    end

    def notify_rejection(quote_request_id:, garage_owner_id: nil)
      @quote_request   = QuoteRequest.find(quote_request_id)
      @garage_owner_id = @quote_request.garage_owner.id rescue 9999

      mail to: @quote_request.garage.email, subject: 'Quotation you proposed has been rejected'
    end


  end
end
