ActiveAdmin.register GarageOwner do
  menu parent: 'Models'
  permit_params :status, :first_name, :last_name, :latitude, :longitude, :date_of_birth,
                :status, :gender, :avatar, :email, :phone_number,
                :fax_number, :po_box_number,
                :address, :city, :state, :zip

  index do
    div do
      [line_chart(data_on_trend(GarageOwner)),
       pie_chart(statuses_data(GarageOwner))].join.html_safe
    end

    selectable_column
    id_column
    column :full_name do |data|
      data.full_name
    end
    column :avatar do |data|
      image_tag data.avatar, width: 50
    end
    column 'Full Address' do |data|
      [data.address, data.zip, data.city, data.state].reject(&:blank?).join(', ')
    end
    column :date_of_birth
    column :status
    column 'Lat/Long' do |data|
      link_to [data.latitude, data.longitude].join(', '),
              "https://maps.google.com/maps?z=12&t=m&q=loc:#{data.latitude}+#{data.longitude}",
              target: '_blank'
    end
    column :last_sign_in_at
    column 'Sign Up date', :created_at
    actions
  end

  form title: 'Edit garage Owner' do |f|
    inputs 'Common Details' do
      input :first_name
      input :last_name
      input :latitude
      input :longitude
      input :date_of_birth, as: :datepicker, datepicker_options: {year_range: '-60:+0',
                                                                  change_month: true,
                                                                  change_year: true}
      input :status
      input :gender, as: :select, collection: ['Male', 'Female']
      input :avatar, as: :file, hint: image_tag(f.object.avatar, width: 100)
    end

    inputs 'Contact Details' do
      input :email
      input :phone_number
      input :fax_number
      input :po_box_number
      input :address
      input :city
      input :state
      input :zip
    end

    actions
  end
end
