# == Schema Information
#
# Table name: comments
#
#  id              :integer          not null, primary key
#  message         :text
#  conversation_id :integer
#  sender_id       :integer
#  receiver_id     :integer
#  metadata        :json
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe Comment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
