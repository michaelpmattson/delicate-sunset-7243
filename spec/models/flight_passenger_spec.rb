require 'rails_helper'

RSpec.describe FlightPassenger, type: :model do
  describe 'relationships' do
    it { should belong_to(:flight) }
    it { should belong_to(:passenger) }
  end

  describe '.class_methods' do
    describe '.flight_passenger_by_ids(flight_id, passenger_id)' do
      it 'finds flight passenger by ids' do
        pan_am = Airline.create!(name: 'Pan American World Airways')
        reno   = pan_am.flights.create!(number: 1234, date: '04/01/1975', departure_city: 'LAX', arrival_city: 'RNO')
        mike   = Passenger.create!(name: 'Mike Brady',   age: 46)

        fp = FlightPassenger.create!(flight_id: reno.id, passenger_id: mike.id)

        expect(FlightPassenger.flight_passenger_by_ids(reno.id, mike.id)).to eq(fp)
      end
    end
  end
end
