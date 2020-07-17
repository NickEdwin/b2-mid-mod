class MechanicsController < ApplicationController

  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    @rides = Ride.find(RideMechanic.where(mechanic_id: @mechanic.id).pluck(:ride_id))
  end

  def create
    @mechanic = Mechanic.find(params[:id])
    @park = Park.find(params[:id])
    @ride = Ride.create!(name: params[:name], thrill_rating: 0, park_id: @park.id)
    RideMechanic.create(ride_id: @ride.id, mechanic_id: @mechanic.id)
    redirect_to "/mechanics/#{@mechanic.id}"
  end
end
