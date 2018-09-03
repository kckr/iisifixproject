# == Schema Information
#
# Table name: quote_request_lots
#
#  id               :integer          not null, primary key
#  vehicle_owner_id :integer
#  metadata         :jsonb
#  status           :integer          default("pending")
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

FactoryGirl.define do
  factory :quote_request_lot do
  end
end
