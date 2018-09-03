# == Schema Information
#
# Table name: settings
#
#  id                            :integer          not null, primary key
#  notify_via_sms                :boolean
#  notify_via_email              :boolean
#  agreed_to_terms_and_condition :boolean
#  user_id                       :integer
#  status                        :integer          default(0)
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#

class Setting < ApplicationRecord
  belongs_to :user
end
