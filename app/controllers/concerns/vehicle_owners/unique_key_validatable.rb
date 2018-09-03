module VehicleOwners
  module UniqueKeyValidatable
    extend ActiveSupport::Concern
    @@actions = []
    included do
      prepend_before_action :set_current_user_from_code!,
                            only: @@actions , if: -> { params[:unique_key] }
    end

    def self.[](actions)
      @@actions = actions
      self
    end

    # This method is used to identify user from unique key in URL params
    #   the unique key is usable for only once. Once used, new key shall be generated
    # #
    def set_current_user_from_code!
      identified_user = User.find_by_unique_key(params[:unique_key])
      raise RuntimeError unless identified_user && identified_user.vehicle_owner?

      sign_in(identified_user)
      identified_user.randomize_identifier
    rescue RuntimeError => e # RuntimeError: Could not find a valid mapping for nil
      flash[:error] = 'The verification code is invalid or already been used.'
      redirect_to root_url
    end
  end
end
