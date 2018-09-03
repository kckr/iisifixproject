require 'rails_helper'

RSpec.describe SignupHelper, type: :helper do
  describe '#activity' do
    let(:vo) { build :vehicle_owner }
    let(:go) { build :garage_owner }
    let(:admin) { build :admin }
    let(:user) { User.new }

    before(:all) do
      # Stubbing Devise's resource_params method
      SignupHelper.class_eval do
        def resource_params
          {}
        end
      end
    end

    context 'Shoulds' do
      context 'When user is thrown from somepage to signin page' do
        it 'should return active for user: VehicleOwner and Form Represents VO SignIn' do
          expect(helper.activity(vo, :VehicleOwner)).to eq('active')
        end

        it 'should return active for user: GarageOwner and Form Represents GO SignIn' do
          expect(helper.activity(go, :GarageOwner)).to eq('active')
        end

        it 'should return active for user: User and random form' do
          # This is when User goes to SignUp page / Redirect to there
          #  the first tab to activate is :VehicleOwner
          expect(helper.activity(user, :VehicleOwner)).to eq('active')
        end
      end

      context 'Redirection after password is wrong' do
        after(:all) do
          SignupHelper.class_eval do
            def resource_params
              { }
            end
          end
        end

        it 'should return active when user types wrong creds from VO tab and form_type: VehicleOwner' do
          SignupHelper.class_eval do
            def resource_params
              { form_type: Base64.encode64('VehicleOwner') }
            end
          end

          expect(helper.activity(nil, :VehicleOwner)).to eq('active')
        end

        it 'should return active when user types wrong creds from GO tab and form_type: GarageOwner' do
          SignupHelper.class_eval do
            def resource_params
              { form_type: Base64.encode64('GarageOwner') }
            end
          end

          expect(helper.activity(nil, :GarageOwner)).to eq('active')
        end
      end
    end

    context 'Should nots' do
      context 'When user is thrown from somepage to signin page' do
        it 'should not return active for user: GarageOwner and Form Represents VO SignIn' do
          expect(helper.activity(go, :VehicleOwner)).not_to eq('active')
        end

        it 'should not return active for user: VehicleOwner and Form Represents GO SignIn' do
          expect(helper.activity(vo, :GarageOwner)).not_to eq('active')
        end

        it 'should not return active for user: VehicleOwner and random form' do
          expect(helper.activity(vo, :SomeRandom)).not_to eq('active')
        end

        it 'should not return active for user: admin and random form' do
          expect(helper.activity(admin, :GarageOwner)).not_to eq('active')
        end

        it 'should not return active for user: admin and random form' do
          expect(helper.activity(admin, :VehicleOwner)).not_to eq('active')
        end
      end

      context 'Redirection after password is wrong' do
        after(:all) do
          SignupHelper.class_eval do
            def resource_params
              { }
            end
          end
        end

        it 'should not return active when user types wrong creds from VO tab and rendering_form_type: GarageOwner' do
          SignupHelper.class_eval do
            def resource_params
              { form_type: Base64.encode64('VehicleOwner') }
            end
          end

          expect(helper.activity(nil, :GarageOwner)).not_to eq('active')
        end

        it 'should return active when user types wrong creds from GO tab and rendering_form_type: VehicleOwner' do
          SignupHelper.class_eval do
            def resource_params
              { form_type: Base64.encode64('GarageOwner') }
            end
          end

          expect(helper.activity(nil, :VehicleOwner)).not_to eq('active')
        end
      end
    end
  end
end
