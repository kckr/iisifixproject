class ApplicationController < ActionController::Base
  include ExceptionHandler
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale
  layout :determine_layout

  private

  def set_admin_locale
    I18n.locale = :en
  end

  def set_locale
    # not setting :fi as default locale because there might come a situation when you have missing translation in :fi
    #  then :en should be used as fallback
    I18n.locale = params[:locale] || :en
  end

  def default_url_options
    { locale: I18n.locale }
  end

  def determine_layout
    'master' if devise_controller?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:email,
                                             :password,
                                             :password_confirmation,
                                             :type])

  end

  def restrict_garage_owner!
    if current_user&.garage_owner?
      raise InvalidRequest, t('application.restrict_garage_owner')
    end
  end

  def authenticate_garage_owner!
    authenticate_user!
    unless current_user.garage_owner?
      raise InvalidRequest, t('application.authenticate_garage_owner')
    end
  end

  def authenticate_vehicle_owner!
    authenticate_user!
    unless current_user.vehicle_owner?
      raise InvalidRequest, t('application.authenticate_vehicle_owner')
    end
  end

  # Once user fills up the confirmation form, he is activated
  #   so further need to go back to that page
  def unconfirmed_user_only!
    unless current_user.email_confirmed?
      redirect_to root_path, alert: t('application.unconfirmed_user_only')
    end
  end

  # Determines the after signin path
  # Overrides devises same method in Devise::SessionsController
  # Target: To let users with incomplete/unconfirmed profile to complete before they continue
  # Usecase: When they click confirmation_link in email, but could not submit the confirmation form
  #   because of some reason. They can recover password and continue.
  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.email_confirmed? && resource_or_scope.vehicle_owner?
      flash[:notice] = t('application.after_sign_in_path_for.notice')
      edit_vehicle_owner_confirmation_path(resource_or_scope)
    elsif resource_or_scope.email_confirmed? && resource_or_scope.garage_owner?
      flash[:notice] = t('application.after_sign_in_path_for.notice')
      edit_garage_owner_confirmation_path(resource_or_scope)
    else
      stored_location_for(resource_or_scope) || signed_in_root_path(resource_or_scope)
    end
  end
end
