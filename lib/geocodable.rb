# `address` field is used to geocode and reverse-geocode
# See https://github.com/alexreisner/geocoder

module Geocodable
  extend ActiveSupport::Concern
  included do

    # can also be an IP address
    geocoded_by :full_street_address unless Rails.env.test?
    # auto-fetch coordinates
    reverse_geocoded_by :latitude, :longitude do |obj, results|
      if geo = results.first
        obj.address = geo.street_address
        obj.city    = geo.city
        # obj.state = geo.state           # Geocoder cannot extract state from places in finland
        obj.zip     = geo.postal_code
      end
    end

    after_validation :geocode, if: ->(obj) { obj.address.present? and obj.address_changed? }

    # Since we do not let anybody change the latitude/Longitude so this is no more needed
    # after_validation :reverse_geocode,
    #                  if:  ->(obj) { obj.latitude_changed? ||
    #                      obj.longitude_changed? } unless Rails.env.test? # auto-fetch address
  end

  def street_address
    address
  end

  def full_street_address
    [street_address, zip, city].join(', ')
  end
end
