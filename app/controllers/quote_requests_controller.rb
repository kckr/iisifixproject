class QuoteRequestsController < ApplicationController
  layout 'master'
  before_action :restrict_garage_owner!
  before_action :set_garages

  def new
    @quote_request = QuoteRequest.new
    @user          = User.new
  end

  def create
    # FIXME Refactor me; I look bulky
    if params_data_valid?
      ActiveRecord::Base.transaction do
        signup_vehicle_owner if current_user.nil? && user_params
        qr_lot               = QuoteRequestLot.create vehicle_owner: current_user || @user
        common_final_payload = quote_request_params.merge(
            { :vehicle_owner_id     => qr_lot.vehicle_owner_id,
              :quote_request_lot_id => qr_lot.id,
              :status               => :pending,
              :service_details      => (params[:quote_request][:service_details]
                                            .select { |k, v| v.present? }.to_hash)
            })


        common_final_payload.merge!(get_data_from_reg_api) if quote_request_params[:vehicle_registration_number].present?

        # Create N number of Quote Request under brand new QuoteRequestLot
        # Created QuoteRequests are still not sent yet.. When VO confirms the email then
        #   immediately it is sent
        @garages.each do |garage|
          quote_request = QuoteRequest.create(common_final_payload.merge({ garage_id: garage.id }))
          if current_user.present? && quote_request.pending?
            send_sms_to_(quote_request)
            GarageOwners::QuoteRequestsMailer.notify_new_request(quote_request_id: quote_request.id).deliver
          end
        end
      end

      flash[:notice] = "#{flash[:notice]} #{t('.notice')}"
      redirect_to root_path
    else
      IisifixLogger.log(@quote_request.inspect)
      IisifixLogger.log(@user.inspect)
      flash.now[:error] = t('.error')
      render :new
    end
  end

  def validate_reg_num
    reg      = RegistrationApi.new(quote_request_params[:vehicle_registration_number])
    response = {
        :make_year  => reg.response.registration_year,
        :make_id   => VehicleVendor.id_from(reg.response.make),
        :model     => reg.response.model
    }

    render json: response, layout: false
  rescue Savon::SOAPFault
    render json: 'false', layout: false
  end

  def load_models
    vendor  = VehicleVendor.find(params[:vehicle][:vendor_id])
    @models = Vehicle.models_for(vendor.name)
    respond_to do |format|
      format.js { render 'load_models', layout: false }
    end
  end

  private

  def user_params
    params[:user] && params.require(:user).permit(:email) || {}
  end

  def quote_request_params
    assemble_services_ids_in_(params)
    # assemble_services_details_in_(params)
    params.require(:quote_request).permit(:vehicle_registration_number,
                                          :vehicle_made_year,
                                          :vehicle_vendor_id,
                                          :vehicle_model,
                                          :mileage,
                                          :report,
                                          :services_ids,
                                          :additional_info,
                                          :agree_katsastus_t_c,
                                          :agree_quote_request_t_c
    )
  end

  def set_garages
    ids = if params[:quote_request] && params[:quote_request][:garages].present?
            session[:garage_ids] = params[:quote_request][:garages].keys
          elsif session[:garage_ids]
            session[:garage_ids]
          end || []

    @garages = Garage.where(id: ids)
  end

  def signup_vehicle_owner
    @user          = VehicleOwner.create user_params
    flash[:notice] = t('quote_requests.signup_vehicle_owner.notice')
  end


  def assemble_services_ids_in_(params)
    unless params[:quote_request][:services_ids].blank? || params[:quote_request][:services_ids].is_a?(String)
      params[:quote_request][:services_ids] = ",#{params[:quote_request][:services_ids].keys.join(',')},"
    end
  end

  def send_sms_to_(quote_request)
    url = garage_owner_quote_request_url(garage_owner_id: quote_request.garage_owner.id, id: quote_request.id, unique_key: quote_request.garage_owner.unique_key)

    SmsHandler.new.send(:to      => quote_request.garage.decorate.full_phone_number,
                        :message => t('quote_requests.send_sms_to_garage_for_new_qr.message',
                                      garage_name:  quote_request.garage.name,
                                      vo_full_name: quote_request.vehicle_owner.full_name,
                                      url:          url))
  end

  def params_data_valid?
    user          = User.new(user_params)
    qr_validity   = is_quote_request_params_valid? # this duplication is intentional
    user_validity = if user.valid? || user_params.blank?
                      true
                    else
                      @quote_request.errors[:user_email] = user.errors[:email][0]
                      false
                    end

    qr_validity && user_validity
  end

  def is_quote_request_params_valid?
    @quote_request = QuoteRequest.new(quote_request_params)
    @quote_request.valid?
  end

  def get_data_from_reg_api
    response       = RegistrationApi.new(quote_request_params[:vehicle_registration_number]).response
    make_id        = VehicleVendor.where("LOWER(name) like LOWER('%#{response.make}%')").first.id
    flash[:notice] = t('quote_requests.get_data_from_reg_api.notice', preamble: flash[:notice])
    response.metadata.merge({
                                :vehicle_registration_number => response.registration_number,
                                :vehicle_model               => response.model,
                                :vehicle_vendor_id           => make_id
                            })
  rescue Savon::SOAPFault
    {}
  end
end
