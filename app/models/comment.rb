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

class Comment < ApplicationRecord
  belongs_to :conversation
  belongs_to :sender, class_name: :User
  belongs_to :receiver, class_name: :User
end
