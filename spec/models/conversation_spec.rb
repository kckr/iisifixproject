# == Schema Information
#
# Table name: conversations
#
#  id               :integer          not null, primary key
#  conversable_id   :integer
#  conversable_type :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'rails_helper'

RSpec.describe Conversation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
