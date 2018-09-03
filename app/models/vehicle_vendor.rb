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
  scope :id_from, -> (make) { where('lower(name) like lower(?)', "%#{make}%").first.id }
end
