module GarageOwners
  class ConfirmationsController < GarageOwnersController
    before_action :unconfirmed_user_only!
    skip_before_action :set_garage
    layout 'master'

    def edit
      current_user.build_setting unless current_user.setting.present?
      current_user.build_garage unless current_user.garage.present?
    end

    def update
      if current_user.update(garage_owner_params_for_confirmation)
        flash[:notice] = t('.notice')
        redirect_to new_user_session_path(q: Base64.encode64(current_user.id.to_s))
      else
        render :edit
      end
    end

    private

    def garage_owner_params_for_confirmation
      setting_attributes  = [:id, :notify_via_sms, :notify_via_email, :agreed_to_terms_and_condition]
      garage_attributes   = [:id, :name, :address, :city, :state, :zip, :registration_number]
      model_config_params = { check_validation: true, password_required: true, activate: true }

      params.require(:garage_owner)
          .permit(:first_name,
                  :last_name,
                  :phone_number,
                  :date_of_birth,
                  :password,
                  :password_confirmation,

                  setting_attributes: setting_attributes,
                  garage_attributes:  garage_attributes).merge(model_config_params)
    end
  end
end
