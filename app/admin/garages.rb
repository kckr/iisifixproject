ActiveAdmin.register Garage do
  menu parent: 'Models'
  permit_params :name, :registration_number, :marketing_tag_line, :warranty_info, :established_at,
                :latitude, :longitude, :logo, :cover, :about, { payment_options: [] }, :email,
                :address, :address, :state, :zip, :po_box_number, :fax_number,
                :facebook_link, :google_map_link, :google_plus_link, :pinterest_link,
                :twitter_link, :linkedin_link, :website_link, :opening_time, :closing_time, :open_days, :vehicle_vendors

  index do
    div do
      line_chart data_on_trend(Garage)
    end

    column :name

    column :garage_owner do |data|
      [image_tag(data.owner.avatar, width: '30'),
       '<br>',
       link_to(data.owner.full_name, admins_garage_owner_path(data.owner))
      ].join('').html_safe
    end

    column :logo do |data|
      image_tag data.logo, width: '30'
    end

    column :registration_number

    column 'Full Address' do |data|
      [data.address, data.zip, data.city, data.state].reject(&:blank?).join(', ')
    end

    column 'Lat/Long' do |data|
      link_to [data.latitude, data.longitude].join(', '),
              "https://maps.google.com/maps?z=12&t=m&q=loc:#{data.latitude}+#{data.longitude}",
              target: '_blank'
    end
    actions
  end

  form title: 'Edit Garage Details' do |f|
    inputs 'Common Details' do
      input :name
      input :registration_number
      input :marketing_tag_line
      input :warranty_info
      input :established_at, as: :datepicker, datepicker_options: { year_range:   '-60:+0',
                                                                    change_month: true,
                                                                    change_year:  true }
      input :latitude
      input :longitude
      input :logo, as: :file, hint: image_tag(f.object.logo, width: 100)
      input :cover, as: :file, hint: image_tag(f.object.cover, width: 100)
      input :about
      input :payment_options, as: :check_boxes, collection: PaymentOption.all.map { |x| [x.name, x.id, { checked: f.object.payment_options.include?(x.id.to_s) }] }
      input :opening_time, hint: 'Eg. 10:30 AM'
      input :closing_time, hint: 'Eg. 5:30 PM'
      input :open_days, hint: 'Eg. Sat, Mon Tue'
      input :vehicle_vendors, label: 'Vehicle Vendors supported'
    end

    inputs 'Contact Details' do
      input :email
      input :address
      input :state
      input :zip
      input :po_box_number
      input :fax_number
    end

    inputs 'URLs' do
      input :facebook_link
      input :google_map_link
      input :google_plus_link
      input :pinterest_link
      input :twitter_link
      input :linkedin_link
      input :website_link
    end

    actions
  end
end
