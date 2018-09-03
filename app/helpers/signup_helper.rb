module SignupHelper
  # When form is submitted, RegistrationsController/SessionsController
  #  build up resource with "form_type" field set.
  # @param form_type [Symbol]
  def activity(resource, form_type)
    'active' if (resource && form_type.to_s == resource.type) ||
        activity_from(resource_params[:form_type], form_type) ||
        (!resource_params[:form_type] && resource && resource&.type.blank? && form_type == :VehicleOwner)
  end

  def activity_from(form_type_from_param, form_type)
    form_type.to_s == Base64.decode64(form_type_from_param || '')
  end

  def range_slider_value(params)
    if params[:min_radius].nil? or params[:max_radius].nil?
      Config::SliderDefaultValue
    elsif params[:min_radius] == "0"
      params[:max_radius]
    else
      "[#{ min_radius_from_(params)},#{ max_radius_from_(params)}]"
    end
  end
end
