# == Schema Information
#
# Table name: payment_options
#
#  id          :integer          not null, primary key
#  name        :string
#  icon_class  :string
#  type        :string
#  description :string
#  metadata    :jsonb
#  status      :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
ActiveAdmin.register PaymentOption do
  menu parent: 'Models'
  permit_params :description, :icon_class, :name
  index do

    selectable_column
    id_column

    column  :name
    # column  :type
    column  :icon_class
    column  :description
    column  :created_at
    column  :updated_at
    actions
  end

  form do |f|
    inputs do
      input :name
      input :icon_class
      input :description
    end
    actions
  end
end
