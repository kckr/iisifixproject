class CreateDataStores < ActiveRecord::Migration[5.0]
  def change
    create_table :data_stores do |t|
      t.json :metadata
      t.string :registration_number

      t.timestamps
    end
  end
end
