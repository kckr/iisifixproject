module VehicleOwners
  class ConfirmationsController < VehicleOwnersController
    skip_before_action :confirmed_user_only!
    before_action :unconfirmed_user_only!

    layout 'master'

    def edit
      current_user.build_setting unless current_user.setting.present?
    end

    def update
      if current_user.update(vehicle_owner_params_for_confirmation)
        update_not_sent_requests_of_(current_user)

        flash[:notice] = t('.notice')
        redirect_to new_user_session_path(q: Base64.encode64(current_user.id.to_s))
      else
        render :edit
      end
    end

    private

    def vehicle_owner_params_for_confirmation
      setting_attributes  = [:id, :notify_via_sms, :notify_via_email, :agreed_to_terms_and_condition]
      model_config_params = { check_validation: true, activate: true }
      password_params     = current_user.provider.nil? ? { password_required: true } : {}

      params.require(:vehicle_owner)
          .permit(:first_name,
                  :last_name,
                  :phone_number,
                  :date_of_birth,
                  :password,
                  :password_confirmation,
                  :company_name,
                  :company_url,
                  setting_attributes: setting_attributes)
          .merge(model_config_params)
          .merge(password_params)
    end

    def update_not_sent_requests_of_(current_user)
      if current_user.quote_requests&.not_sent.present?
        current_user.quote_requests.not_sent.each do |quote_request|
          quote_request.pending!
          send_sms_to_(quote_request)
          GarageOwners::QuoteRequestsMailer.notify_new_request(quote_request_id: quote_request.id).deliver

          IisifixLogger.log 'Quote Request updated from Not_sent to Pending !'
        end
      end
    end

    def send_sms_to_(quote_request)
      url = garage_owner_quote_request_url(garage_owner_id: quote_request.garage_owner.id, id: quote_request.id)

      SmsHandler.new.send(to:      quote_request.garage.decorate.full_phone_number,
                          message: t('vehicle_owners.confirmations.send_sms_to_garage_for_new_qr.message',
                                     garage_name:  quote_request.garage.name,
                                     vo_full_name: quote_request.vehicle_owner.full_name,
                                     url:          url))
    end
  end
end
