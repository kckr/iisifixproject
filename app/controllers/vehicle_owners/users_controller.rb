module VehicleOwners
  class UsersController < VehicleOwnersController
    layout 'master', only: [:edit]

    def edit
    end

    def update
      if current_user.update(vehicle_owner_params_for_confirmation)
        flash[:notice] = t('.notice')
        redirect_to action: :edit
      else
        render :edit
      end
    end

    private

    def vehicle_owner_params_for_confirmation
      setting_attributes  = [:id, :notify_via_sms, :notify_via_email]
      model_config_params = { check_validation: true, password_required: false, activate: true }

      params.require(:vehicle_owner).permit(:email,
                                            :avatar,
                                            :first_name,
                                            :last_name,
                                            :phone_number,
                                            :date_of_birth,
                                            :password,
                                            :password_confirmation,
                                            :company_name,
                                            :company_url,
                                            setting_attributes: setting_attributes).merge(model_config_params)
    end
  end
end
