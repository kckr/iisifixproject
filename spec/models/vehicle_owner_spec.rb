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

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    context 'When :check_validation flag is not set' do
      subject { build :vehicle_owner, check_validation: false }
      it { should validate_presence_of :email }
      it { should validate_uniqueness_of(:email).case_insensitive }
      it { should accept_nested_attributes_for :setting }

      it { should_not validate_presence_of :date_of_birth }
      it { should_not validate_presence_of :first_name }
      it { should_not validate_presence_of :last_name }
      it { should_not validate_presence_of :phone_number }
    end

    context 'When :check_validation flag is set' do
      subject { build :vehicle_owner, check_validation: true }
      it { should validate_presence_of :first_name }
      it { should validate_presence_of :last_name }
      it { should validate_presence_of :phone_number }
    end

    context 'When :password_required flag is set' do
      subject { build :vehicle_owner, password_required: true }
      it { should validate_presence_of :password }
      it { should validate_presence_of :password_confirmation }
      it { should validate_confirmation_of :password }
    end

    context 'Temporary password set when signup' do
      context 'When :password_required flag is not set' do
        let(:vo) { create(:vehicle_owner,
                          password_required:     false,
                          password:              'somepassword',
                          password_confirmation: 'somepassword') }
        it 'should set metadata["temp_password"] with the userpassword' do
          expect(vo.metadata['temp_password']).to eq(vo.password)
        end
      end

      context 'When :password_required flag is set' do
        let(:vo) { create(:vehicle_owner,
                          password_required:     true,
                          password:              'somepassword',
                          password_confirmation: 'somepassword') }
        it 'should set metadata["temp_password"] with the userpassword' do
          expect(vo.metadata['temp_password']).to be_nil
        end
      end

      # Note: the temp_password stored in metadata is sent to user for temporary entry
      #   so that they can complete the confirmation form
      #   When the form is complete, they will have the password they set.
    end
  end

  describe 'Associations' do
    subject { build :vehicle_owner }
    it { should have_one :setting }
  end

  context 'States of Object' do
    it 'should set Enum for "status" field' do
      expect(User.statuses.keys).to eq(%w(unconfirmed email_confirmed active cancelled))
    end
    context 'Just after signup' do
      it 'should be at unconfirmed state' do
        vo = build_stubbed :vehicle_owner
        expect(vo.unconfirmed?).to eq(true)
      end
      it 'should be at any other states' do
        vo = build_stubbed :vehicle_owner
        expect(%w(email_confirmed active cancelled)).not_to include(vo.status)
      end
    end
  end

  context 'JSON scopes defined' do
    let(:vo) { create :vehicle_owner, metadata: {company_name: 'SEO',
                                                 company_url: 'seobeetree.com',
                                                 job_title: 'Sr. Software Engineer'}}
    it 'should define :company_name scope defined' do
      expect(vo.company_name).to eq('SEO')
    end

    it 'should define :company_url scope defined' do
      expect(vo.company_url).to eq('seobeetree.com')
    end

    it 'should define :job_title scope defined' do
      expect(vo.job_title).to eq('Sr. Software Engineer')
    end
  end
end
