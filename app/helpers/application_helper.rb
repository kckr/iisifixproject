module ApplicationHelper
  # TODO: Fill actual state names according to Locale
  def finnish_states
    [
        'Lappi',
        'Pohjois-Pohjanmaa',
        'Kainuu',
        'Pohjois-Karjala',
        'Pohjois-Savo',
        'Etelä-Savo',
        'Etelä-Pohjanmaa',
        'Keski-Pohjanmaa',
        'Pohjanmaa',
        'Pirkanmaa',
        'Keski-Suomi',
        'Satakunta',
        'Varsinais-Suomi',
        'Etelä-Karjala',
        'Päijät-Häme',
        'Kanta-Häme',
        'Uusimaa',
        'Kymenlaakso',
        'Ahvenanmaa'
    ]
  end

  def active_class(link_path, root: false)
    'active' if (request.fullpath == link_path) || (request.fullpath == root_path && root == true)
  end

  # Gets email address from the encoded user_id in URL
  #   http://localhost:3000/login?q=1aa123as
  # @return [String] email
  def get_email_for(url_code)
    resource_from_(url_code).email
  rescue
    ''
  end

  def resource_from_(url_code_or_email)
    user_id = Base64.decode64(url_code_or_email)
    User.find(user_id)
  rescue
    User.find_by_email(url_code_or_email) || resource
  end

  def min_radius_from_(params)
    LocationService.get_min_radius_from_(params)
  end

  def max_radius_from_(params)
    LocationService.get_max_radius_from_(params)
  end

  def garage_distance_from_(params, request, garage)
    payload = ' '
    payload << '<strong>'
    payload << number_with_precision(garage.distance_from(LocationService.get_lat_long_from_(params, request))) rescue 'Unknown'
    payload << '</strong>'
    payload << ' KM Away,&nbsp;'
    payload << garage.full_street_address
    payload.html_safe
  end

  def quote_request_response_data_attrs_for_(quote_request)
    {
        'data-response-url'      => "#{respond_garage_owner_quote_request_path(garage_owner_id: current_user.id, id: quote_request.id)}",
        'data-quote-request-url' => "#{garage_owner_quote_request_path(garage_owner_id: current_user.id, id: quote_request.id)}",
        'data-customer-name'     => "#{quote_request.vehicle_owner.full_name}",
        'data-vehicle-vendor'    => "#{quote_request.vehicle_vendor.name}",
        'data-vehicle-model'     => "#{quote_request.vehicle_model}"
    }
  end

  def confirm_job_attributes_for_(job, current_user)
    {
        'data-target-url'  => vehicle_owner_job_rating_path(vehicle_owner_id: current_user.id, job_id: job.id),
        'data-job-url'     => vehicle_owner_job_path(vehicle_owner_id: current_user.id, id: job.id),
        'data-garage-name' => job.garage_name
    }
  end

end
