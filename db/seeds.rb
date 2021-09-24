# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

pan_am    = Airline.create!(name: 'Pan American World Airways')
reno      = pan_am.flights.create!(number: 1234, date: '04/01/1975', departure_city: 'LAX', arrival_city: 'RNO')
kenosha   = pan_am.flights.create!(number: 4321, date: '04/01/1975', departure_city: 'LAX', arrival_city: 'ENW')
dc        = pan_am.flights.create!(number: 6545, date: '04/25/1976')

united    = Airline.create!(name: 'United Airlines')
honolulu  = united.flights.create!(number: 6872, date: '04/01/1975', departure_city: 'LAX', arrival_city: 'HNL')

mike   = Passenger.create!(name: 'Mike Brady',   age: 46)
carol  = Passenger.create!(name: 'Carol Brady',  age: 46)
marcia = Passenger.create!(name: 'Marcia Brady', age: 18)
jan    = Passenger.create!(name: 'Jan Brady',    age: 16)
cindy  = Passenger.create!(name: 'Cindy Brady',  age: 13)
greg   = Passenger.create!(name: 'Greg Brady',   age: 13)
peter  = Passenger.create!(name: 'Peter Brady',  age: 10)
bobby  = Passenger.create!(name: 'Bobby Brady',  age: 10)
alice  = Passenger.create!(name: 'Alice Nelson', age: 52)

reno.passengers << mike
reno.passengers << carol
reno.passengers << marcia

kenosha.passengers << mike
kenosha.passengers << marcia
kenosha.passengers << jan
kenosha.passengers << cindy
kenosha.passengers << greg
kenosha.passengers << peter
kenosha.passengers << bobby

dc.passengers << marcia

honolulu.passengers << alice
