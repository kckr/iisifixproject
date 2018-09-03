class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.integer     :star_count
      t.references  :job,       foreign_key: true, index: true
      t.references  :user,      foreign_key: true, index: true
      t.jsonb       :metadata,  default: {}

      t.timestamps
    end
  end
end
