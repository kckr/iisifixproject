# == Schema Information
#
# Table name: vehicle_vendors
#
#  id          :integer          not null, primary key
#  name        :string
#  country     :string
#  description :string
#  metadata    :jsonb
#  status      :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class VehicleVendor < ApplicationRecord
  def self.id_from(make)
    if vendor = self.where('lower(name) like lower(?)', "%#{make}%").first
      vendor.id
    else
      self.create(name: make).id
    end
  end
end
