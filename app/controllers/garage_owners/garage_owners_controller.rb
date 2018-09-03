module GarageOwners
  class GarageOwnersController < ApplicationController
    before_action :authenticate_garage_owner!
    before_action :set_garage

    private
    def set_garage

      @garage = current_user.garage || begin
        flash[:error] = t('garage_owners.garage_owners.set_garage.error')
        sign_out current_user
        redirect_to root_path
      end
    end
  end
end