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

class Job < ApplicationRecord
  belongs_to :quote_request
  belongs_to :garage
  has_one :rating
  # Reducing data duplication, reuse the information from QuoteRequest
  delegate :garage,
           :garage_id,
           :garage_name,
           :vehicle_owner,
           :vehicle_info,
           :vehicle_registration_number,
           :vehicle_made_year,
           :vehicle_vendor,
           :vehicle_vendor_id,
           :vehicle_model,
           :mileage,
           :quoted_amount,
           :warranty_offer,
           :proposed_start_date,
           :proposed_end_date,
           :report_url,
           :services,
           :additional_info,
           to:        :quote_request,
           allow_nil: true

  # See definitions/job.md for more info
  StatusPending   = :pending
  StatusCancelled = :cancelled
  StatusDoing     = :doing
  StatusDone      = :done
  StatusConfirmed = :confirmed
  enum status: [StatusPending, StatusCancelled, StatusDoing, StatusDone, StatusConfirmed]

  scope :active, -> { where(status: [:pending, :doing, :done]) } # Done is the last state of the Job
  scope :archived, -> { where(status: [:cancelled, :confirmed]) }
  scope :hot_for_vo, -> { where(status: [:pending, :done]) }
  scope :hot_for_go, -> { where(status: [:pending, :done]) }

  # Definition of Hotness of the job
  # - It still requires user's interventions
  # - There is still something to be done/reviewed by the user
  # - Status of the Job can still be changed to something else
  # Example: job at state `done` can be confirmed by VO and moved to `Confirmed`
  # #

  # Only for Vehicle Owner
  def cancellable?
    status.to_sym.in? [:pending]
  end

  # Only for Vehicle Owner
  def confirmable?
    status.to_sym.in? [:done]
  end

  # Only for Garage Owner
  def startable?
    status.to_sym.in? [:pending]
  end

  # Only for Garage Owner
  def completable?
    status.to_sym.in? [:doing]
  end
end
