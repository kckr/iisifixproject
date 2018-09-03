require 'rails_helper'

RSpec.describe GaragesController, type: :controller do
  before { GeocoderStubber.start }

  let!(:g_sankhamul) { create :garage, name: 'Garage', address: 'Sankhamul Bridge, Patan 44600, Nepal' }
  let!(:g_chakupat) { create :garage, name: 'Patan bazar workshop', address: 'Chakupat Rd, Patan 44600, Nepal' }
  let!(:g_patan_dhoka) { create :garage, name: "Patandhoka's Garages", address: 'Patan Dhoka, Patan 44600, Nepal' }
  let!(:garage4) { create :garage, name: 'Garage', address: 'Patan Sundhara, Patan, Nepal' }
  let!(:g_thankot) { create :garage, name: 'Garage', address: 'Thankot, Chandragiri 44619, Nepal' }

  let!(:garage6) { create :garage, name: 'Garage', address: 'Bhaktapur Nala Rd, Nepal' }
  let!(:garage7) { create :garage, name: 'Ram Garage', address: 'New York, NY' }
  let!(:garage8) { create :garage, name: 'Garage', address: 'Turku, Finland' }
  let!(:garage9) { create :garage, name: 'Garage', address: 'Sunwal, Nepal' }
  let!(:g_sankhamul0) { create :garage, name: 'Garage', address: 'Siddharthanagar, Nepal' }
  let!(:g_sankhamul1) { create :garage, name: 'Garage', address: 'Milan Chowk, Butwal 32907, Nepal' }

  let(:lat_of_area_with_no_garages) { Geocoder.coordinates('Khaireni, Devdaha Municipality 32900, Nepal').first }
  let(:long_of_area_with_no_garages) { Geocoder.coordinates('Khaireni, Devdaha Municipality 32900, Nepal').second }

  describe 'GET#index' do
    it 'should render :index template' do
      get :index, params: { q:   { Garage::SearchPredicate => 'somegaragename' },
                            lat: g_sankhamul.latitude, long: g_sankhamul.longitude }
      expect(response).to render_template :index
      expect(response.status).to eq(200)
    end

    describe 'Location based search' do

      context 'With search query' do
        it 'when 0 km - 0 km range is given, no result shall be displayed' do
          get :index,
              params: { :q          => { Garage::SearchPredicate => 'garage' },
                        :lat        => lat_of_area_with_no_garages,
                        :long       => long_of_area_with_no_garages,
                        :min_radius => 0,
                        :max_radius => 0 }
          expect(assigns(:garages).map &:id).to eq([])
        end

        it 'should return the garages with name "Ram" in any of the fields with in 1KM area of g_sankhamul'\
           'i.e. should only return garages from Sankhamul, Chakupat' do
          get :index,
              params: { :q          => { Garage::SearchPredicate => 'Patandhoka' },
                        :lat        => g_sankhamul.latitude,
                        :long       => g_sankhamul.longitude,
                        :min_radius => 0,
                        :max_radius => 1 }
          expect(assigns(:garages).map &:id).to eq([g_patan_dhoka.id])
        end
      end

      context 'Without search query' do
        it 'when 0 km - 0 km range is given, no result shall be displayed' do
          get :index,
              params: { :q          => { Garage::SearchPredicate => '' },
                        :lat        => lat_of_area_with_no_garages,
                        :long       => long_of_area_with_no_garages,
                        :min_radius => 0,
                        :max_radius => 0 }

          expect(assigns(:garages).map &:id).to eq([])
        end

        it 'should return the garages with name "Ram" in any of the fields with in 1KM area of g_sankhamul'\
           'i.e. should only return garages from Sankhamul and Chakupat' do
          get :index,
              params: { :q          => { Garage::SearchPredicate => '' },
                        # :lat        => g_sankhamul.latitude,
                        # :long       => g_sankhamul.longitude,
                        :min_radius => 0,
                        :max_radius => 1 }

          # This should not include g_sankhamul as user is exactly at g_sankhamul and no need to show that
          expect(assigns(:garages).map &:id).to eq([g_chakupat.id, g_sankhamul.id, g_patan_dhoka.id])

          expect(assigns(:garages).map &:id).not_to include(g_thankot.id)
        end

        it 'should include the garages at thankot which is within 13KM area from sankhamul' do
          get :index,
              params: { :q          => { Garage::SearchPredicate => '' },
                        :lat        => g_sankhamul.latitude,
                        :long       => g_sankhamul.longitude,
                        :min_radius => 0,
                        :max_radius => 13 }
          expect(assigns(:garages).map &:id).to include(g_thankot.id)
        end

        context 'When range is selected from 2KM to 13KM from sankhamul' do
          it 'should include the garages at thankot which is within 2KM to 13KM area from sankhamul' do
            get :index,
                params: { :q          => { Garage::SearchPredicate => '' },
                          :lat        => g_sankhamul.latitude,
                          :long       => g_sankhamul.longitude,
                          :min_radius => 2,
                          :max_radius => 13 }
            expect(assigns(:garages).map &:id).to include(g_thankot.id)
          end

          it 'should not include the garages at sankhamul and chakupat area which is within 2KM' do
            get :index,
                params: { :q          => { Garage::SearchPredicate => '' },
                          :lat        => g_sankhamul.latitude,
                          :long       => g_sankhamul.longitude,
                          :min_radius => 2,
                          :max_radius => 13 }
            expect(assigns(:garages).map &:id).not_to include(g_sankhamul.id)
          end
        end
      end

    end
  end
end
