class DeviseOverride::ConfirmationsController < Devise::ConfirmationsController
  # GET /resource/confirmation/new
  # def new
  #   super
  # end

  # POST /resource/confirmation
  # def create
  #   super
  # end

  # GET /resource/confirmation?confirmation_token=abcdef
  # def show
  #   super
  # end
  protected

  # The path used after resending confirmation instructions.
  # def after_resending_confirmation_instructions_path_for(resource_name)
  #   super(resource_name)
  # end

  # The path used after confirmation.
  # def after_confirmation_path_for(resource_name, resource)
  #   super(resource_name, resource)
  # end

  def after_confirmation_path_for(resource_name, resource)
    if resource.vehicle_owner?
      sign_in resource
      edit_vehicle_owner_confirmation_path(resource)
    elsif resource.garage_owner?
      sign_in resource
      edit_garage_owner_confirmation_path(resource)
    else
      flash[:error] = 'Invalid request'
      root_path
    end
  end
end
