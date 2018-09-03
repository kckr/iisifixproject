ActiveAdmin.register QuoteRequest do
  menu parent: 'Models'
  permit_params :vehicle_registration_number,
                :vehicle_made_year,
                :vehicle_vendor_id,
                :vehicle_model,
                :mileage,
                :status,
                :report,
                :quoted_amount,
                :additional_info,
                :notify_via_sms,
                :warranty_offer,
                :proposed_end_date,
                :proposed_start_date
  index do
    div do
      [line_chart(data_on_trend(QuoteRequest)),
       pie_chart(statuses_data(QuoteRequest))].join.html_safe
    end
    selectable_column
    id_column
    column :vehicle_registration_number
    column :vehicle_made_year
    column :vehicle_vendor_id
    column :vehicle_model
    column :mileage
    column :status
    column :report do |data|
      link_to data.report.file.filename, data.report_url if data.report.file.present?
    end
    column :quoted_amount
    column :additional_info do |qr|
      qr.additional_info.length > 30 ? "#{qr.additional_info[0..30]}.." : qr.additional_info
    end
    column :sms do |data|
      data.notify_via_sms ? 'Yes' : 'No'
    end
    column :garage_id
    column 'Q Lot', :quote_request_lot_id
    column :comments do |data|
      data&.conversation&.comments.count
    end
    actions
  end

  form do |f|
    f.inputs "Quote Request details" do
      f.input :report
      f.input :quoted_amount
      f.input :mileage

      f.input :vehicle_registration_number
      f.input :vehicle_made_year
      f.input :vehicle_vendor_id
      f.input :vehicle_model
      f.input :proposed_start_date, as: :datepicker, datepicker_options: { year_range:   '0:+10',
                                                                           change_month: true,
                                                                           change_year:  true }
      f.input :proposed_end_date, as: :datepicker, datepicker_options: { year_range:   '0:+10',
                                                                         change_month: true,
                                                                         change_year:  true }

      f.input :status
      f.input :additional_info
      f.input :notify_via_sms
      f.input :warranty_offer
    end
    f.actions
  end
end
