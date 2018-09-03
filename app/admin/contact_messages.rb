ActiveAdmin.register Contact do
  menu parent: 'Models'
  permit_params :first_name,
                :last_name,
                :email,
                :subject,
                :body,
                :status

  index do
    column :name do |data|
      data.full_name
    end
    column :email
    column :subject
    column :body
    column :status
    column :sent_at do |data|
      data.created_at
    end

    actions
  end

  form do |f|
    f.inputs "Received Message" do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :subject
      f.input :body
      f.input :status
    end
    f.actions
  end
end

# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  email      :string
#  subject    :string
#  body       :text
#  status     :integer          default(0)
#  metadata   :json
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
