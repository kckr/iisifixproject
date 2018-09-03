ActiveAdmin.register Category do
  menu parent: 'Models'
  permit_params :name, :description, :status
end
