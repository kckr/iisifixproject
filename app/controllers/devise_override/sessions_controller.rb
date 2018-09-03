class DeviseOverride::SessionsController < Devise::SessionsController
  # sushil: commenting below as it doesn't seem required, #simplifying
  # before_action :set_type, only: :create # This should be executed at first
  # before_action :sign_in_rules, only: :create

  # POST /resource/sign_in
  # def create
  # end

  private

  def set_type
    if Base64.decode64(params['user']['form_type']).in? ['VehicleOwner', 'GarageOwner', 'Admin']
      # this params['user']['type'] is used in method `sign_in_rules` nowhere else
      params['user']['type'] = Base64.decode64(params['user']['form_type'])
    else
      flash[:error] = t('devise_override.sessions.set_type.error')
      redirect_to :back
    end
  end

  # Client asks to do this, may be this makes sense from their perspective
  # A/c to me: I am not buying this s#!t
  def sign_in_rules
    @user = User.find_by_email(resource_params[:email])
    if @user && @user.type != resource_params[:type]
      flash[:error] = t('devise_override.sessions.sign_in_rules.error')
      redirect_to new_user_session_path(q: Base64.encode64(@user&.id.to_s))
    end
  end

end
