# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  first_name             :string           default("")
#  last_name              :string           default("")
#  phone_number           :string           default("")
#  fax_number             :string
#  po_box_number          :string
#  address                :string           default("")
#  city                   :string           default("")
#  state                  :string           default("")
#  zip                    :string           default("")
#  latitude               :float
#  longitude              :float
#  date_of_birth          :date
#  metadata               :jsonb
#  type                   :string
#  deleted_at             :datetime
#  status                 :integer          default("unconfirmed")
#  gender                 :integer
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string
#  locked_at              :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  provider               :string
#  uid                    :string
#  avatar                 :string
#  unique_key             :string
#

class User < ApplicationRecord
  include Geocodable # see lib/geocodable.rb

  StatusUnconfirmed    = :unconfirmed
  StatusEmailConfirmed = :email_confirmed
  StatusActive         = :active
  StatusCancelled      = :cancelled

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :confirmable,
         :lockable, :timeoutable, :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]

  store :metadata, accessors: [:temp_password]

  has_one :setting, dependent: :destroy
  accepts_nested_attributes_for :setting

  enum status: [StatusUnconfirmed, StatusEmailConfirmed, StatusActive, StatusCancelled]

  mount_uploader :avatar, AvatarUploader

  attr_accessor :check_validation, :password_required, :activate

  validates :email, presence: true, uniqueness: { case_sensitive: true }
  validates :password, presence: true, confirmation: true, if: :password_required
  validates :password_confirmation, presence: true, if: :password_required
  validates_presence_of :first_name, :last_name, :phone_number, if: :check_validation

  # only during signup, system generated passwords, remember?
  before_create :inject_temp_password, unless: :password_required
  before_create :set_unique_key, unless: :password_required
  before_save :set_as_email_confirmed, if: :confirmed_at_changed? # Just after confirmation link is clicked
  before_save :activate_user, if: :activate # Just after confirmation form is complete

  def full_name
    [first_name, last_name].join(' ')
  end

  def vehicle_owner?
    false
  end

  def garage_owner?
    false
  end

  def admin?
    false
  end

  def role
    self.type
  end

  def randomize_identifier
    set_unique_key
    self.save
  end

  private

  def inject_temp_password
    self.temp_password = password
  end

  def activate_user
    self.status = 'active'
  end

  def set_as_email_confirmed
    self.status = 'email_confirmed'
  end

  def set_unique_key
    begin
      self.unique_key = SecureRandom.hex[0..9]
    end while self.invalid?
  end
end
