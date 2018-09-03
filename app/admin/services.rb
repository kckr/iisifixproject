ActiveAdmin.register Service do
  menu parent: 'Models'
  permit_params :status, :name, :description, :category_id
  index do
    selectable_column
    id_column
    column :name
    column :category
    column 'Creator', sortable: 'services.garage_id' do |data|
      if data.creator.present?
        link_to data.creator&.name, admins_garage_path(data.creator)
      else
        'Admin'
      end
    end
    column :description
    column :status
    actions
  end

  form do |f|
    inputs do
      input :name
      input :description
      input :status
      input :category
    end
    actions
  end
end
