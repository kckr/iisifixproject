# == Schema Information
#
# Table name: garages
#
#  id                  :integer          not null, primary key
#  user_id             :integer
#  name                :string
#  registration_number :string
#  marketing_tag_line  :string
#  warranty_info       :string
#  established_at      :date
#  email               :string
#  address             :string
#  city                :string
#  state               :string
#  zip                 :string
#  phone_number        :string
#  po_box_number       :string
#  fax_number          :string
#  latitude            :float
#  longitude           :float
#  logo                :string
#  cover               :string
#  about               :text
#  metadata            :jsonb
#  urls                :jsonb
#  opening_time        :string
#  closing_time        :string
#  open_days           :string           default([]), is an Array
#  payment_options     :string           default([]), is an Array
#  vehicle_vendors     :text             default([]), is an Array
#  services_ids        :text             default([]), is an Array
#  status              :integer          default(0)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

FactoryGirl.define do
  factory :garage do
    name { "#{Faker::Name.name}'s garage'" }
    address {"#{Faker::Address.street_address}, #{Faker::Address.city}, #{Faker::Address.country}"}
    latitude { Geocoder.coordinates(address).first }
    longitude { Geocoder.coordinates(address).last }
  end
end
