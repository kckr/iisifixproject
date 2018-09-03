class GarageDecorator < Draper::Decorator
  delegate_all

  # @param coordinate [Array]
  #   Ex: [latitude, longitude]
  def distance_from(coordinate)
    Geocoder::Calculations.distance_between([latitude, longitude], coordinate)
  end

  def full_phone_number
    if name.downcase.match(/nepal/) || owner.full_name.downcase.match(/nepal/)
      "+9779#{phone_number}"
    else
      phone_number.length > 10 ? phone_number : "#{ENV['CountryCode']}#{phone_number}"
    end
  end
end
