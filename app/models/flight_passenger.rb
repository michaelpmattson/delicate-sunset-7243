class FlightPassenger < ApplicationRecord
  belongs_to :flight
  belongs_to :passenger

  def self.flight_passenger_by_ids(flight_id, passenger_id)
    where(flight_id: flight_id, passenger_id: passenger_id).first
  end
end
