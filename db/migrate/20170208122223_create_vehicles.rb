class CreateVehicles < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicles do |t|
      t.string :fuelType
      t.string :make
      t.string :model
      t.string :range
      t.string :rangeCity
      t.string :year
      t.string :VClass
      t.string :cylinders
      t.string :displ

      t.timestamps
    end
  end
end
