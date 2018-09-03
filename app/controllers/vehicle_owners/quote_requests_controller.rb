module VehicleOwners
  class QuoteRequestsController < VehicleOwnersController
    include UniqueKeyValidatable[:show]
    before_action :set_quote_request, except: :index

    layout 'master', only: [:index, :show]

    def index
      @active_quote_request_lots   = current_user.quote_request_lots.pending
      @archived_quote_request_lots = current_user.quote_request_lots.archived
    end

    def show
    end

    def cancel
      @quote_request.cancelled!
      mark_lot_as_expire_for_(@quote_request)

      GarageOwners::QuoteRequestsMailer.notify_cancellation(quote_request_id: @quote_request.id).deliver_now

      # Note: here intentionally `.now` is missing; its no mistake
      flash[:notice] = t('.notice')
      render js: "window.location='#{root_path}'"
    end

    # patch /customers/:vehicle_owner_id/bids/:id/accept
    def accept
      accept_quote_request

      flash[:notice] = t('.notice')
      render js: "window.location='#{root_path}'"
    end

    def reject
      @quote_request.rejected!

      GarageOwners::QuoteRequestsMailer.notify_rejection(quote_request_id: @quote_request.id).deliver_now

      mark_lot_as_expire_for_(@quote_request)

      # Note: here intentionally `.now` is missing; its no mistake
      flash[:notice] = t('.notice')
      render js: "window.location='#{root_path}'"
    end

    private

    def accept_quote_request
      @quote_request.accepted!
      mark_lot_as_accepted_for_(@quote_request)

      GarageOwners::QuoteRequestsMailer.notify_acceptance(quote_request_id: @quote_request.id).deliver_now
      send_sms_of_acceptance_to_(@quote_request)
      create_a_job_for_(@quote_request)

    end

    def set_quote_request
      @quote_request = current_user.quote_requests.find(params[:id]).decorate
    end

    def mark_lot_as_expire_for_(quote_request)
      if @quote_request.lot.quote_requests.active.count == 0
        @quote_request.lot.expired!
      end
    end

    def mark_lot_as_accepted_for_(quote_request)
      @quote_request.lot.accepted!
    end

    def send_sms_of_acceptance_to_(quote_request)
      url = garage_owner_quote_request_url(garage_owner_id: quote_request.garage_owner.id,
                                           id:              quote_request.id,
                                           unique_key:      quote_request.garage_owner.unique_key)

      SmsHandler.new.send(:to      => quote_request.garage.decorate.full_phone_number,
                          :message => t('vehicle_owners.quote_requests.send_sms_of_acceptance_to_garage.message',
                                        garage_name:  quote_request.garage.name,
                                        vo_full_name: quote_request.vehicle_owner.full_name,
                                        url:          url))
    end

    def create_a_job_for_(quote_request)
      job = quote_request.create_job # default status will be `pending`
      IisifixLogger.log "Job created for quote_request: #{quote_request.id} with id: #{job.id}"
    end

  end
end
