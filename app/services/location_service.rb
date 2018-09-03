module LocationService
  # @return [Array] [Lat, Long]
  #   Ex:  [40.71, 100.23]
  def get_lat_long_from_(params, request)
    if Rails.env.test? || request.safe_location&.latitude == 0 && request.safe_location&.longitude == 0
      [Config::DefaultLat, Config::DefaultLong]
    elsif  params[:lat].present? && params[:long].present?
      [params[:lat].to_f, params[:long].to_f]
    else
      # Sometimes `safe_location` comes nil in production
      [request.safe_location.try(:latitude) || request.location.try(:latitude) || 0 ,
       request.safe_location.try(:longitude) || request.location.try(:longitude) || 0]
    end
  end

  def get_max_radius_from_(params)
    (params[:max_radius] || Config::DefaultMaxRadius).to_f
  end

  def get_min_radius_from_(params)
    (params[:min_radius] || Config::DefaultMinRadius).to_f
  end

  def get_address_from_(params, request)
    coords = get_lat_long_from_(params, request)
    Geocoder.search(coords.join(', ')).first&.address
  end

  module_function :get_lat_long_from_, :get_min_radius_from_,
                  :get_max_radius_from_, :get_address_from_
end
