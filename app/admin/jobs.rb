ActiveAdmin.register Job, new_record: false do
  menu parent: 'Models'
  permit_params :status
  index do
    div do
      line_chart data_on_trend(Job)
    end
    selectable_column
    id_column
    column  :rating
    column  :status
    column  :garage_id
    column  :quote_request_id
    actions
  end


  form do |f|
    f.inputs "Job details" do
      f.input :status
    end
    f.actions
  end
end
