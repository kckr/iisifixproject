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

class Conversation < ApplicationRecord
  belongs_to :conversable, polymorphic: true
  has_many :comments
end
