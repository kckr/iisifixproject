class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.integer :quote_request_id
      t.integer :status, default: 0
      t.jsonb :metadata

      t.timestamps
    end
  end
end
