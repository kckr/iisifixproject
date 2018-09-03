class CreateGarages < ActiveRecord::Migration[5.0]
  def change
    create_table :garages do |t|
      t.references :user, foreign_key: true, index: true

      t.string :name
      t.string :registration_number
      t.string :marketing_tag_line
      t.string :warranty_info
      t.date   :established_at

      t.string :email
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone_number
      t.string :po_box_number
      t.string :fax_number
      t.float  :latitude
      t.float  :longitude

      # Images
      t.string :logo
      t.string :cover

      t.text :about

      t.jsonb :metadata, default: {}
      t.jsonb :urls,     default: {}

      t.string :opening_time
      t.string :closing_time

      # Array Types
      t.string :open_days,       array: true, default: []
      t.string :payment_options, array: true, default: []
      t.text   :vehicle_vendors, array: true, default: []
      t.text   :services_ids,    array: true, default: []


      t.integer :status,         default: 0 #:active

      t.timestamps
    end

    add_index :garages, :open_days,       using: :gin
    add_index :garages, :payment_options, using: :gin
    add_index :garages, :vehicle_vendors, using: :gin

  end
end
