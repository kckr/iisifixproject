module GarageOwners
  class QuoteRequestsController < GarageOwnersController
    include UniqueKeyValidatable[:show]
    before_action :set_quote_request, except: :index

    layout 'master', only: [:index, :show]

    def index
      @active_quote_requests    = @garage.quote_requests.published.active.decorate
      @archived_quote_requests  = @garage.quote_requests.archived.decorate
    end

    def show
    end

    def respond
      @quote_request.update(response_params.merge(status: :responded))
      VehicleOwners::QuoteRequestsMailer.notify_response(quote_request_id: @quote_request.id).deliver_now
      send_sms_of_response_to(@quote_request)

      # Note: here intentionally `.now` is missing; its no mistake
      flash[:notice] = t('.notice')
      redirect_to root_path
    end

    def ignore
      @quote_request.ignored!
      mark_lot_as_expire_for_(@quote_request)
      VehicleOwners::QuoteRequestsMailer.notify_no_interest(quote_request_id: @quote_request.id).deliver_now

      # Note: here intentionally `.now` is missing; its no mistake
      flash[:notice] = t('.notice')
      render js: "window.location='#{root_path}'"
    end

    private

    def mark_lot_as_expire_for_(quote_request)
      if @quote_request.lot.quote_requests.active.count == 0
        @quote_request.lot.expired!
      end
    end

    def set_quote_request
      @quote_request = @garage.quote_requests.find(params[:id]).decorate
    end

    def response_params
      params.require(:quote_request).permit(:quoted_amount,
                                            :proposed_start_date,
                                            :proposed_end_date,
                                            :warranty_offer)
    end

    def send_sms_of_response_to(quote_request)
      url = vehicle_owner_quote_request_url(vehicle_owner_id: quote_request.vehicle_owner_id,
                                            id: quote_request.id,
                                            unique_key: quote_request.vehicle_owner.unique_key)

      SmsHandler.new.send(to: quote_request.vehicle_owner.decorate.full_phone_number,
                          message: t('garage_owners.quote_requests.send_sms_of_response_to_vo.message',
                                     vo_first_name: quote_request.vehicle_owner.first_name,
                                     garage_name:   quote_request.garage.name,
                                     url:           url))
    end
  end
end
