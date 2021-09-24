require 'rails_helper'

RSpec.describe Flight do
  describe 'relationships' do
    it { should belong_to(:airline) }
    it { should have_many(:flight_passengers) }
    it { should have_many(:passengers).through(:flight_passengers) }
  end

  describe '#instance_methods' do
    describe '#airline_name' do
      it 'returns the airline name' do
        pan_am = Airline.create!(name: 'Pan American World Airways')
        reno   = pan_am.flights.create!(number: 1234, date: '04/01/1975', departure_city: 'LAX', arrival_city: 'RNO')

        expect(reno.airline_name).to eq('Pan American World Airways')
      end
    end
  end
end
