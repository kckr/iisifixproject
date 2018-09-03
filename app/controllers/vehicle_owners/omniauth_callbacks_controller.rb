module VehicleOwners
  class OmniauthCallbacksController < ::Devise::OmniauthCallbacksController
    def google_oauth2
      handle_payload(provider: 'google_oauth2', provider_kind: 'Google')
    end

    def facebook
      handle_payload(provider: 'facebook', provider_kind: 'Facebook')
    end

    def failure
      redirect_to root_path
    end

    private

    def handle_payload(provider:, provider_kind:)
      # You need to implement the method below in your model (e.g. app/models/user.rb)
      @user = VehicleOwner.from_omniauth(request.env['omniauth.auth'])

      if @user.persisted?
        sign_in_and_redirect @user, :event => :authentication # this will throw if @user is not activated
        set_flash_message(:notice, :success, :kind => provider_kind) if is_navigational_format?
      else
        session["devise.#{provider}_data"] = request.env['omniauth.auth']
        redirect_to new_user_registration_url
      end
    end
  end
end
