class CreateVehicleVendors < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicle_vendors do |t|
      t.string :name
      t.string :country
      t.string :description
      t.jsonb :metadata

      t.integer :status,      default: 0 #:unapproved
      t.timestamps
    end
  end
end
