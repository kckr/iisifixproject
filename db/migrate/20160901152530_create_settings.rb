class CreateSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :settings do |t|
      t.boolean     :notify_via_sms
      t.boolean     :notify_via_email
      t.boolean     :agreed_to_terms_and_condition

      t.references  :user,        foreign_key: true, index: true

      t.integer     :status,      default: 0 #:active
      t.timestamps
    end

  end
end
