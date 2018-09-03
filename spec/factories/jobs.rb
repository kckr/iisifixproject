# == Schema Information
#
# Table name: jobs
#
#  id               :integer          not null, primary key
#  quote_request_id :integer
#  status           :integer          default("pending")
#  metadata         :jsonb
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

FactoryGirl.define do
  factory :job do
    
  end
end
