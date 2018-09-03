ActiveAdmin.register VehicleVendor do
  menu parent: 'Models'
  permit_params :status
  index do
    selectable_column
    id_column
    column  :name
    column  :country
    column  :description
    actions
  end

  form do |f|
    f.inputs 'Vehicle Vendor details' do
      f.input :name
      f.input :country
      f.input :description
    end
    f.actions
  end
end

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
