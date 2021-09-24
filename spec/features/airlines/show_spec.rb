require 'rails_helper'

RSpec.describe 'airline show page' do
  context 'when i visit the show page' do
    before(:each) do
      @pan_am = Airline.create!(name: 'Pan American World Airways')
      @reno      = @pan_am.flights.create!(number: 1234, date: '04/01/1975', departure_city: 'LAX', arrival_city: 'RNO')
      @kenosha   = @pan_am.flights.create!(number: 4321, date: '04/01/1975', departure_city: 'LAX', arrival_city: 'ENW')

      @united    = Airline.create!(name: 'United Airlines')
      @honolulu  = @united.flights.create!(number: 6872, date: '04/01/1975', departure_city: 'LAX', arrival_city: 'HNL')

      @mike   = Passenger.create!(name: 'Mike Brady',   age: 46)
      @carol  = Passenger.create!(name: 'Carol Brady',  age: 46)
      @marcia = Passenger.create!(name: 'Marcia Brady', age: 18)
      @jan    = Passenger.create!(name: 'Jan Brady',    age: 16)
      @cindy  = Passenger.create!(name: 'Cindy Brady',  age: 13)
      @greg   = Passenger.create!(name: 'Greg Brady',   age: 13)
      @peter  = Passenger.create!(name: 'Peter Brady',  age: 10)
      @bobby  = Passenger.create!(name: 'Bobby Brady',  age: 10)
      @alice  = Passenger.create!(name: 'Alice Nelson', age: 52)

      @reno.passengers << @mike
      @reno.passengers << @carol

      @kenosha.passengers << @mike
      @kenosha.passengers << @marcia
      @kenosha.passengers << @jan
      @kenosha.passengers << @cindy
      @kenosha.passengers << @greg
      @kenosha.passengers << @peter
      @kenosha.passengers << @bobby

      @honolulu.passengers << @alice

      visit "/airlines/#{@pan_am.id}"
    end

    it 'has a list of passengers on the airline' do
      expect(page).to have_content(@mike.name)
      expect(page).to have_content(@carol.name)
    end

    it 'does not have duplicates' do
      expect(page).to have_content(@mike.name).once
    end

    it 'only has adults (18 and up)' do
      save_and_open_page
      expect(page).to     have_content(@marcia.name)
      expect(page).to_not have_content(@cindy.name)
    end
  end
end
