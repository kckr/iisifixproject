class CreateServices < ActiveRecord::Migration[5.0]
  def change
    create_table :services do |t|
      t.string      :name
      t.references  :category,    foreign_key: true, index: true
      t.references  :garage,      foreign_key: true, index: true
      t.string      :description
      t.integer     :status,      default: 0 #:unapproved
      t.jsonb       :metadata

      t.timestamps
    end
  end
end
