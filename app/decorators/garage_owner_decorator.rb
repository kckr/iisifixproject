class GarageOwnerDecorator < Draper::Decorator
  delegate_all

  def full_phone_number
    if full_name.downcase.match(/nepal/)
      "+9779#{phone_number}"
    else
      phone_number.length > 10 ? phone_number : "#{ENV['CountryCode']}#{phone_number}"
    end
  end
end
