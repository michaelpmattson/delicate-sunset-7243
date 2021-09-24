class Airline < ApplicationRecord
  has_many :flights
  has_many :passengers, through: :flights

  def display_passengers
    passengers.distinct
              .where('age >= ?', 18)
              .select('passengers.*, COUNT(flights.id) AS flight_count')
              .group(:id)
              .order('flight_count DESC')
  end
end
