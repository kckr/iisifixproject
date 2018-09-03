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

require 'rails_helper'

RSpec.describe Job, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
