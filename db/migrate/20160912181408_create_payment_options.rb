class CreatePaymentOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :payment_options do |t|
      t.string :name
      t.string :icon_class
      t.string :type
      t.string :description

      t.jsonb  :metadata, default: {}
      t.integer :status,      default: 0 #:unpublished
      t.timestamps
    end
  end
end
