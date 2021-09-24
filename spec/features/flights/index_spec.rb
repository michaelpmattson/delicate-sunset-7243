require 'rails_helper'

RSpec.describe 'flights index page' do
  context 'when I visit the flights index page' do
    before(:each) do
      @pan_am = Airline.create!(name: 'Pan American World Airways')
      @reno      = @pan_am.flights.create!(number: 1234, date: '04/01/1975', departure_city: 'LAX', arrival_city: 'RNO')
      @kenosha   = @pan_am.flights.create!(number: 4321, date: '04/01/1975', departure_city: 'LAX', arrival_city: 'ENW')

      @united    = Airline.create!(name: 'United Airlines')
      @honolulu  = @united.flights.create!(number: 6872, date: '04/01/1975', departure_city: 'LAX', arrival_city: 'HNL')

      @mike   = Passenger.create!(name: 'Mike Brady',   age: 46)
      @carol  = Passenger.create!(name: 'Carol Brady',  age: 46)
      @marcia = Passenger.create!(name: 'Marcia Brady', age: 16)
      @jan    = Passenger.create!(name: 'Jan Brady',    age: 16)
      @cindy  = Passenger.create!(name: 'Cindy Brady',  age: 13)
      @greg   = Passenger.create!(name: 'Greg Brady',   age: 13)
      @peter  = Passenger.create!(name: 'Peter Brady',  age: 10)
      @bobby  = Passenger.create!(name: 'Bobby Brady',  age: 10)
      @alice  = Passenger.create!(name: 'Alice Nelson', age: 52)

      @reno.passengers << @mike
      @reno.passengers << @carol

      @kenosha.passengers << @marcia
      @kenosha.passengers << @jan
      @kenosha.passengers << @cindy
      @kenosha.passengers << @greg
      @kenosha.passengers << @peter
      @kenosha.passengers << @bobby

      @honolulu.passengers << @alice

      visit '/flights'
    end

    it 'lists all flight numbers' do

    end

    xit 'prints the name of each airline next to the flight' do

    end

    xit 'prints the names of all passengers under each flight number' do

    end
  end
end
