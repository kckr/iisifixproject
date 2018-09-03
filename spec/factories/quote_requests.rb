# == Schema Information
#
# Table name: quote_requests
#
#  id                   :integer          not null, primary key
#  garage_id            :integer
#  vehicle_owner_id     :integer
#  quote_request_lot_id :integer
#  vehicle_info         :jsonb
#  additional_services  :jsonb
#  service_details      :jsonb
#  metadata             :jsonb
#  services_ids         :text             default([]), is an Array
#  warranty_offer       :string
#  additional_info      :text
#  status               :integer          default("not_sent")
#  proposed_start_date  :date
#  proposed_end_date    :date
#  report               :string
#  quoted_amount        :float            default(0.0)
#  notify_via_sms       :boolean
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

FactoryGirl.define do
  factory :quote_request do
    agree_katsastus_t_c true
    agree_quote_request_t_c true
  end
end
