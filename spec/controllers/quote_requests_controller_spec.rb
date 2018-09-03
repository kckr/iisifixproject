require 'rails_helper'

RSpec.describe QuoteRequestsController, type: :controller do
  describe 'post#create' do
    let(:garage_owner) { create :garage_owner, confirmed_at: DateTime.now }
    let(:vehicle_owner) { create :vehicle_owner, confirmed_at: DateTime.now }
    let(:garage) { create :garage, user_id: garage_owner.id, phone_number: '1231231233' }
    let(:quote_request_params) { {
        :garages                 => { garage.id => 's' },
        :services_ids            => { '1' => 'on' },
        :service_details         => { '1' => '12' },
        :agree_katsastus_t_c     => true,
        :agree_quote_request_t_c => true
    } }

    before(:each) {
      sign_in(vehicle_owner)
      post :create, params: { quote_request: quote_request_params, user: { email: 'asdd@asd.sd' } }
    }

    after(:each) { SmsHandler.flush_log }

    it "should send an SMS to the Garage's phone number" do
      expect(SmsHandler.sent_smses.count).to be(1)
      expect(SmsHandler.sent_smses[0][:to]).to eq(garage.phone_number)
    end

    it "should send link to garage's quote_request show page" do
      expect(SmsHandler.sent_smses[0][:text]).to match("garages/#{garage_owner.id}/bids/")
    end

    it "should send proper link in SMS to the Garage's phone number" do
      expect(SmsHandler.sent_smses.count).to be(1)
      expect(SmsHandler.sent_smses[0][:text]).to match(/unique_key/)
    end

    it 'should increase the count of quoterequests by 1' do
      expect(vehicle_owner.quote_requests.count).to eq(1)
    end

    it 'should redirect the VO to root' do
      expect(response).to redirect_to(root_path)
    end

    it 'should set a flash message' do
      expect(flash[:notice]).to match('Your request has been filed and will be processed shortly.')
    end

    it 'should send an email to the garage owner' do
      expect(ActionMailer::Base.deliveries.last.to.first).to eq(garage_owner.email)
    end
  end
end
