require 'rails_helper'

RSpec.describe VehicleOwners::QuoteRequestsController, type: :controller do
  let(:garage_owner) { create :garage_owner, confirmed_at: DateTime.now }
  let(:vehicle_owner) { create :vehicle_owner, confirmed_at: DateTime.now }
  let(:garage) { create :garage, user_id: garage_owner.id }
  let!(:lot) { create :quote_request_lot, vehicle_owner_id: vehicle_owner.id }
  let!(:quote_request) { create :quote_request, garage_id: garage.id, vehicle_owner_id: vehicle_owner.id,
                                quote_request_lot_id:      lot.id }
  before(:each) { vehicle_owner.active! }
  describe '#show' do

    it 'should let vehicle_owner let in without creds, just with unique_key' do
      get :show, params: { unique_key:       vehicle_owner.unique_key,
                           id:               quote_request.id,
                           vehicle_owner_id: vehicle_owner.id }

      expect(response.status).to be(200)
    end

    it 'should not let vehicle_owner let in with invalid/random unique_key' do
      get :show, params: { unique_key:       'random_unique_key',
                           id:               quote_request.id,
                           vehicle_owner_id: vehicle_owner.id }
      expect(response.status).to be(302)
    end

    it 'should not let garage_owner let in with valid unique_key' do
      get :show, params: { unique_key:       garage_owner.unique_key,
                           id:               quote_request.id,
                           vehicle_owner_id: garage_owner.id }
      expect(response.status).to be(302)
      expect(flash[:error]).to match(/The verification code is invalid or already been used./)
    end

  end

  describe 'patch#accept' do
    before(:each) {
      sign_in(vehicle_owner)
      patch :accept, params: { vehicle_owner_id: vehicle_owner.id, id: quote_request.id }
    }

    after(:each) { SmsHandler.flush_log }

    it 'should send an SMS to the GO about the approval' do
      expect(SmsHandler.sent_smses.count).to be(1)
      expect(SmsHandler.sent_smses[0][:to]).to eq(garage.phone_number)
    end

    it 'should send a valid link to the Garage Owner' do
      expect(SmsHandler.sent_smses[0][:text]).to include("garages/#{garage_owner.id}/bids/#{quote_request.id}?unique_key=#{garage_owner.unique_key}")
    end

    it 'should send an email to the garage owner' do
      expect(ActionMailer::Base.deliveries.last.to.first).to eq(garage_owner.email)
    end
  end
end
