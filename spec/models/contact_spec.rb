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

require 'rails_helper'

RSpec.describe Contact, type: :model do

  it 'has a valid factory' do
    expect(build(:contact)).to be_valid
  end

  it 'is invalid without first_name' do
    expect(build(:contact, first_name: nil)).not_to be_valid
  end

  it 'is invalid without last_name' do
    expect(build(:contact, last_name: nil)).not_to be_valid
  end

  it 'is invalid without email' do
    expect(build(:contact, email: nil)).not_to be_valid
  end

  it 'is invalid without valid email' do
    expect(build(:contact, email: 'notanemail')).not_to be_valid
  end

  it 'is invalid without body' do
    expect(build(:contact, body: nil)).not_to be_valid
  end
end
