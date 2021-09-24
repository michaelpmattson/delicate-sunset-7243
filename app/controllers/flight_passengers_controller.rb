class FlightPassengersController < ApplicationController
  def destroy
    flight_passenger = FlightPassenger.flight_passenger_by_ids(params[:flight_id], params[:id])
    flight_passenger.destroy
    redirect_to flights_path
  end
end
