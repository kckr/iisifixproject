# == Schema Information
#
# Table name: ratings
#
#  id         :integer          not null, primary key
#  star_count :integer
#  job_id     :integer
#  user_id    :integer
#  metadata   :jsonb
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Rating < ApplicationRecord
  belongs_to :job
  belongs_to :reviewer, class_name: :VehicleOwner, foreign_key: :user_id

  store :metadata, accessors: [:company_name, :job_title, :testimonial]
  scope :average_score, -> { average(:star_count) }
end
