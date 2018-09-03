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

FactoryGirl.define do
  factory :contact do |f|
    f.first_name { Faker::Name.first_name }
    f.last_name { Faker::Name.last_name }
    f.email { Faker::Internet.free_email }
    f.subject { Faker::Hipster.sentence }
    f.body { Faker::Hipster.paragraph }
  end
end
