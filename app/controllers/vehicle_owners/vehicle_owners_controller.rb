module VehicleOwners
  class VehicleOwnersController < ApplicationController
    before_action :authenticate_vehicle_owner!
    before_action :confirmed_user_only! # Make sure VO submitted confirmation form

    private

    # Once user fills up the confirmation form, he is activated
    #   so further need to go back to that page
    def confirmed_user_only!
      unless current_user.active?
        redirect_to edit_vehicle_owner_confirmation_path(vehicle_owner_id: current_user.id), alert: t('vehicle_owners.confirmed_user_only!')
      end
    end
  end
end
