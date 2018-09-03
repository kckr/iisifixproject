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

class VehicleOwner < User
  # See Readme.md for detail about this construct
  store :metadata, accessors: [:company_name, :company_url, :job_title]

  has_many :quote_request_lots
  has_many :quote_requests
  has_many :jobs, through: :quote_requests

  def vehicle_owner?
    true
  end

  class << self
    def from_omniauth(auth)
      where(email: auth.info.email).first_or_create do |user|
        *first_name, last_name = auth.info.name.split(' ')

        user.provider          = auth.provider
        user.uid               = auth.uid
        user.email             = auth.info.email
        user.password          = Devise.friendly_token[0, 20]
        user.first_name        = first_name.join(' ')
        user.last_name         = last_name
        user.remote_avatar_url = picture_url_from_(auth, user)
        user.gender            = auth.extra.raw_info.gender
        user.date_of_birth     = auth.extra.raw_info.birthday
        # user.company_url       = auth.extra.raw_info.website
        # user.company_name      = company_name(auth.extra.raw_info.work)
        # user.job_title         = position(auth.extra.raw_info.work)
        user.confirmed_at      = DateTime.now
        user.status            = User::StatusActive
        user.address           = auth.info.location
      end
    end

    # Example work_list [Array of Hashes]
    # [
    #  {"description"=>"Contribution to OSS community",
    #   "employer"=>{"id"=>"1386475401668854", "name"=>"Open source Community"},
    #   "position"=>{"id"=>"109542932398298", "name"=>"Software Engineer"},
    #   "start_date"=>"2014-09-30",
    #   "end_date"=>"0000-00",
    #   "id"=>"1259306694084434"},
    #  ]
    def company_name(work_list)
      work_list.first.employer.name
    rescue
      ''
    end

    def position(work_list)
      work_list.first.position.name
    rescue
      ''
    end

    def picture_url_from_(auth, user)
      if user.provider == 'facebook' && auth.info.image.present?
        auth.extra.raw_info.picture.data.url
      else
        auth.info.image
      end
    end
  end
end
