class AddUniqueIdentificationTokenToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :unique_key, :string, unique: true
    User.where(unique_key: nil).each do |user|
      user.update(unique_key: SecureRandom.hex[0..9])
    end
    add_index :users, :unique_key, unique: true
  end
end
