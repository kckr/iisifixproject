# == Schema Information
#
# Table name: garages
#
#  id                  :integer          not null, primary key
#  user_id             :integer
#  name                :string
#  registration_number :string
#  marketing_tag_line  :string
#  warranty_info       :string
#  established_at      :date
#  email               :string
#  address             :string
#  city                :string
#  state               :string
#  zip                 :string
#  phone_number        :string
#  po_box_number       :string
#  fax_number          :string
#  latitude            :float
#  longitude           :float
#  logo                :string
#  cover               :string
#  about               :text
#  metadata            :jsonb
#  urls                :jsonb
#  opening_time        :string
#  closing_time        :string
#  open_days           :string           default([]), is an Array
#  payment_options     :string           default([]), is an Array
#  vehicle_vendors     :text             default([]), is an Array
#  services_ids        :text             default([]), is an Array
#  status              :integer          default(0)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Garage < ApplicationRecord
  include Geocodable # see lib/geocodable.rb

  CountryName     = 'Finland'
  SearchPredicate = :name_or_address_or_city_or_state_or_zip_or_about_cont_any

  store :urls, accessors: [:facebook_link,
                           :google_map_link,
                           :google_plus_link,
                           :pinterest_link,
                           :twitter_link,
                           :linkedin_link,
                           :website_link]

  belongs_to :garage_owner, foreign_key: :user_id
  alias owner garage_owner

  has_many :quote_requests
  has_many :jobs, through: :quote_requests
  has_many :ratings, through: :jobs

  before_create :inject_data_from_owner, if: :owner # i.e. only after confirmation
  mount_uploader :logo, LogoUploader
  mount_uploader :cover, CoverUploader

  scope :sort_by_ratings_asc, -> {joins(:ratings).group('id').order('AVG(ratings.star_count)')}
  scope :sort_by_ratings_desc, -> {joins(:ratings).group('id').order('AVG(ratings.star_count) desc')}
  scope :sort_by_distance_asc, -> {order('distance asc')}
  scope :sort_by_distance_desc, -> {order('distance desc')}

  has_many :created_services, class_name: :Service
  accepts_nested_attributes_for :created_services, reject_if: -> (service) { service[:name].blank? }

  def selected_payment_options
    PaymentOption.where id: self.payment_options
  end

  def services
    Service.where(id: self.services_ids)
  end

  def supported_vehicle_vendors
    VehicleVendor.where(id: self.vehicle_vendors)
  end

  def avg_rating
    ratings.average_score.ceil rescue 0
  end

  private

  def inject_data_from_owner # before create
    # Inject email address and phone_number of owner to the garage as well
    self.phone_number = owner.phone_number
    self.email        = owner.email
  end

end
