class CreateQuoteRequestLots < ActiveRecord::Migration[5.0]
  def change
    create_table :quote_request_lots do |t|
      t.references    :vehicle_owner,      index: true
      t.jsonb         :metadata,           default: {}

      t.integer       :status,             default: 0 #:unapproved
      t.timestamps
    end
  end
end
