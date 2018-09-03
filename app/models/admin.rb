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

class Admin < User
  def admin?
    true
  end
end
