# == Schema Information
#
# Table name: services
#
#  id          :integer          not null, primary key
#  name        :string
#  category_id :integer
#  garage_id   :integer
#  description :string
#  status      :integer          default("unapproved")
#  metadata    :jsonb
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Service < ApplicationRecord
  belongs_to :category
  belongs_to :creator, foreign_key: :garage_id, class_name: :Garage

  enum status: [:unapproved, :approved] #default is :unapproved

  # Get services by Admin or by that particular garage but unapproved
  scope :by, ->(garage) {where("status = 1 or (garage_id = ? and status = 0)", garage.id)}
  after_commit :update_services_ids_in_garage, on: :create, if: :creator

  private

  # Enlist the service into the array of services Garage choose to provide
  #  This happens when GO chooses to create new additional service.
  def update_services_ids_in_garage
    creator.services_ids << self.id
    creator.save
  end
end
