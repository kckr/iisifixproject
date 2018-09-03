class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :message
      t.integer :conversation_id
      t.integer :sender_id
      t.integer :receiver_id
      t.json :metadata

      t.timestamps
    end
    add_index :comments, :conversation_id
    add_index :comments, :sender_id
    add_index :comments, :receiver_id
  end
end
