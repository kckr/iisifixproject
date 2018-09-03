class CreateQuoteRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :quote_requests do |t|
      t.references  :garage,                 index: true
      t.references  :vehicle_owner,          index: true
      t.references  :quote_request_lot,      index: true

      # This will contain all the present as well as future attributes regarding the Vehicle
      t.jsonb       :vehicle_info,            default: {}
      t.jsonb       :additional_services,     default: [{}] # { name: '', description: '', category_id: 0 }
      t.jsonb       :service_details,         default: {}   # { 1: 'details', 2: '12333'}

      t.jsonb       :metadata,                default: {}
      t.text        :services_ids,            array: true, default: []

      t.string      :warranty_offer
      t.text        :additional_info
      t.integer     :status,                  default: 0 # :not_sent
      t.date        :proposed_start_date
      t.date        :proposed_end_date
      t.string      :report                   # file field
      t.float       :quoted_amount,           default: 0.0
      t.boolean     :notify_via_sms           # comment notification
      t.timestamps
    end
  end
end
