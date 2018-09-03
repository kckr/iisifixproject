# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  email      :string
#  subject    :string
#  body       :text
#  status     :integer          default("unread")
#  metadata   :json
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Contact < ApplicationRecord
  validates_presence_of :first_name, :last_name, :email, :body
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  enum status: [:unread, :read]
  def full_name
    [first_name, last_name].join(' ')
  end
end
