require 'rails_helper'

RSpec.describe GarageOwners::QuoteRequestsController, type: :controller do
  let(:garage_owner) { create :garage_owner, confirmed_at: DateTime.now }
  let(:vehicle_owner) { create :vehicle_owner, confirmed_at: DateTime.now }
  let(:garage) { create :garage, user_id: garage_owner.id }
  let!(:quote_request) { create :quote_request, garage_id: garage.id, vehicle_owner_id: vehicle_owner.id }

  describe '#show' do
    it 'should let garage_owner let in without creds, just with unique_key' do
      get :show, params: { unique_key:      garage_owner.unique_key,
                           id:              quote_request.id,
                           garage_owner_id: garage_owner.id }
      expect(response.status).to be(200)
    end

    it 'should not let garage_owner let in with invalid/random unique_key' do
      get :show, params: { unique_key:      'random_unique_key',
                           id:              quote_request.id,
                           garage_owner_id: garage_owner.id }
      expect(response.status).to be(302)
    end

    it 'should not let vehicle_owner in with valid unique_key' do
      get :show, params: { unique_key:      vehicle_owner.unique_key,
                           id:              quote_request.id,
                           garage_owner_id: vehicle_owner.id }
      expect(response.status).to be(302)
      expect(flash[:error]).to match(/The verification code is invalid or already been used./)
    end

    it 'should redirect the user is no params["unique_key"] is present' do
      get :show, params: { id:              quote_request.id,
                           garage_owner_id: garage_owner.id }
      expect(response.status).to be(302)
    end

    it 'should alter/regenerate the unique_key for the garage owner, once unique_key is already used' do
      get :show, params: { unique_key:      garage_owner.unique_key,
                           id:              quote_request.id,
                           garage_owner_id: garage_owner.id }
      expect(garage_owner.unique_key).not_to eq(garage_owner.reload.unique_key)
    end
  end

  describe 'patch#respond' do
    before(:each) {
      sign_in(garage_owner)
      patch :respond, params: {garage_owner_id: garage_owner.id, id: quote_request.id, quote_request:{
          :quoted_amount => 200,
          :proposed_start_date => '12/12/2016',
          :proposed_end_date => '12/12/2016',
          :warranty_offer => 'No warranty at all'
      }}
    }

    after(:each) { SmsHandler.flush_log }

    it 'should send an SMS to the VO about the response' do
      expect(SmsHandler.sent_smses.count).to be(1)
      expect(SmsHandler.sent_smses[0][:to]).to eq(vehicle_owner.phone_number)
    end

    it 'should send a valid link to the Vehicle Owner' do
      expect(SmsHandler.sent_smses[0][:text]).to include("customers/#{vehicle_owner.id}/bids/#{quote_request.id}?unique_key=#{vehicle_owner.unique_key}")
    end

    it 'should send an email to the vehicle owner' do
      expect(ActionMailer::Base.deliveries.last.to.first).to eq(vehicle_owner.email)
    end
  end
end
