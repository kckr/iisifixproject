# == Schema Information
#
# Table name: quote_requests
#
#  id                   :integer          not null, primary key
#  garage_id            :integer
#  vehicle_owner_id     :integer
#  quote_request_lot_id :integer
#  vehicle_info         :jsonb
#  additional_services  :jsonb
#  service_details      :jsonb
#  metadata             :jsonb
#  services_ids         :text             default([]), is an Array
#  warranty_offer       :string
#  additional_info      :text
#  status               :integer          default("not_sent")
#  proposed_start_date  :date
#  proposed_end_date    :date
#  report               :string
#  quoted_amount        :float            default(0.0)
#  notify_via_sms       :boolean
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class QuoteRequest < ApplicationRecord
  StatusReponded  = :responded
  StatusPending   = :pending
  StatusCancelled = :cancelled
  StatusNotSent   = :not_sent
  StatusRejected  = :rejected
  StatusIgnored   = :ignored
  StatusAccepted  = :accepted

  belongs_to :quote_request_lot
  alias lot quote_request_lot

  belongs_to :garage
  belongs_to :vehicle_owner
  has_one :conversation, as: :conversable

  delegate :name,
           :owner,
           to:        :garage,
           prefix:    true,
           allow_nil: true

  has_one :job

  mount_uploader :report, ReportUploader
  attr_accessor :agree_katsastus_t_c, :agree_quote_request_t_c, :skip_validation
  validates_presence_of :agree_katsastus_t_c, on: :create, unless: :skip_validation
  # See definitions/quote_request.md for more info
  enum status: [StatusNotSent, StatusPending, StatusReponded, StatusAccepted, StatusRejected, StatusIgnored, StatusCancelled]

  # This is duplicate information we keep here
  store :vehicle_info, accessors: [:vehicle_registration_number,
                                   :vehicle_made_year,
                                   :vehicle_vendor_id,
                                   :vehicle_model,
                                   :mileage,

                                   :description,
                                   :registration_year,
                                   :make, :make_description,
                                   :model, :model_description,
                                   :vin, # Vehicle Indentification Number
                                   :insurer,
                                   :tow_bar
                                  ]

  scope :published, -> { where.not(status: StatusNotSent) }
  scope :archived, -> { where(status: [StatusAccepted, StatusCancelled, StatusIgnored, StatusRejected]) }
  scope :active, -> { where.not(status: [StatusAccepted, StatusCancelled, StatusIgnored]) }
  scope :hot_for_vo, -> { where(status: [StatusReponded]) }
  scope :hot_for_go, -> { where(status: [StatusPending]) }

  # Definition of Hotness of the QuoteRequest
  # - It still requires user's interventions
  # - There is still something to be done/reviewed by the user
  # - Status of the QR can still be changed to something else
  # Example: QR at state `responded` can be confirmed by VO and moved to `Accepted`
  # #

  after_create :create_a_conversation

  def services
    Service.where(id: services_ids)
  end

  def vehicle_vendor
    VehicleVendor.find(vehicle_vendor_id)
  end

  def categorised_services
    services.decorate.group_by { |x| x.category.name }
  end

  # Only for Vehicle Owner
  def cancellable?
    status.to_sym.in? [StatusNotSent, StatusPending]
  end

  # Only for Vehicle Owner
  def acceptable?
    status.to_sym.in? [StatusReponded]
  end

  # Only for Vehicle Owner
  def rejectable?
    status.to_sym.in? [StatusReponded]
  end

  # Only for Garage Owner
  def ignorable?
    status.to_sym.in? [StatusPending]
  end

  # Only for Garage Owner
  def quotable?
    status.to_sym.in? [StatusPending]
  end

  def archived?
    status.to_sym.in? [StatusAccepted, StatusCancelled, StatusIgnored, StatusRejected]
  end

  private
  def create_a_conversation
    create_conversation
  end
end
