class CreateConversations < ActiveRecord::Migration[5.0]
  def change
    create_table :conversations do |t|
      t.integer :conversable_id
      t.string :conversable_type

      t.timestamps
    end

    add_index :conversations, [:conversable_id, :conversable_type]

    QuoteRequest.all.each do |qr|
      qr.create_conversation
    end
  end
end
