class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string  :first_name
      t.string  :last_name
      t.string  :email
      t.string  :subject
      t.text    :body

      # Enum field
      t.integer :status,      default: 0 #:unread

      t.json    :metadata,    default: {}

      t.timestamps
    end
  end
end
