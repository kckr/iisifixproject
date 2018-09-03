module GarageOwners
  class GarageProfilesController < GarageOwnersController
    before_action :set_garage

    layout 'master'

    def edit
      @vendors    = VehicleVendor.all
      @categories = Category.all
    end

    def update
      if @garage.update(garage_profile_params)
        flash[:notice] = t('.notice')
        redirect_back fallback_location: garage_path(@garage)
      else
        @vendors    = VehicleVendor.all
        @categories = Category.all
        flash.now[:error] = t('.error')
        render :edit
      end
    end

    private

    def set_garage
      @garage = current_user.garage
      @garage.created_services.build
    end

    def garage_profile_params
      assemble_open_days_in_(params)

      assemble_payment_options_in_(params) # in payment options tab

      assemble_vehicle_vendors_in_(params)

      assemble_services_ids_in_(params)

      params.require('garage').permit([:name,
                                       :registration_number,
                                       :marketing_tag_line,
                                       :established_at,
                                       :email,
                                       :address,
                                       :logo,
                                       :cover,
                                       :city,
                                       :state,
                                       :zip,
                                       :phone_number,
                                       :fax_number,
                                       :po_box_number,

                                       :open_days,
                                       :payment_options,
                                       :vehicle_vendors,
                                       :services_ids,
                                       :warranty_info,

                                       :opening_time,
                                       :closing_time,
                                       :website_link,
                                       :facebook_link,
                                       :twitter_link,
                                       :google_map_link,
                                       :pinterest_link,
                                       :about,

                                       created_services_attributes: [:name, :description, :category_id]
                                      ])
    end

    # Fixme SO repeative code, refactor
    def assemble_open_days_in_(params)
      unless params[:garage][:open_days].blank? || params[:garage][:open_days].is_a?(String)
        # Needed to put an extra space before the comma separated values, because rails trims the first character
        # i.e. 'sun' appears to be 'un'
        params[:garage][:open_days] = ",#{params[:garage][:open_days].keys.join(',')},"
      end
    end

    def assemble_payment_options_in_(params)
      unless params[:garage][:payment_options].blank? || params[:garage][:payment_options].is_a?(String)
        params[:garage][:payment_options] = ",#{params[:garage][:payment_options].keys.join(',')},"
      end
    end

    def assemble_vehicle_vendors_in_(params)
      unless params[:garage][:vehicle_vendors].blank? || params[:garage][:vehicle_vendors].is_a?(String)
        params[:garage][:vehicle_vendors] = ",#{params[:garage][:vehicle_vendors].keys.join(',')},"
      end
    end

    def assemble_services_ids_in_(params)
      unless params[:garage][:services_ids].blank? || params[:garage][:services_ids].is_a?(String)
        params[:garage][:services_ids] = ",#{params[:garage][:services_ids].keys.join(',')},"
      end
    end
  end
end
