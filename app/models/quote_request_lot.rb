# == Schema Information
#
# Table name: quote_request_lots
#
#  id               :integer          not null, primary key
#  vehicle_owner_id :integer
#  metadata         :jsonb
#  status           :integer          default("pending")
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class QuoteRequestLot < ApplicationRecord
  has_many :quote_requests
  belongs_to :vehicle_owner

  enum status: [:pending, :accepted, :expired]

  scope :archived, -> { where(status: [:accepted, :expired]) }

  def self.requests_needing_action
    QuoteRequest.where(quote_request_lot_id: self.ids, status: [QuoteRequest::StatusReponded])
  end

  def vehicle_model
    self.quote_requests.first.vehicle_model
  end

  def vehicle_vendor
    self.quote_requests.first.vehicle_vendor
  end
end
