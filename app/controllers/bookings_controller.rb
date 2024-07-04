class BookingsController < ApplicationController

  def index
    @bookings = Booking.where(visitor: current_user)
    @reviews = Review.all
    @planets = Planet.all
    @my_planet_bookings = Booking.where(planet: current_user.planets)
    @planet = Planet.new
  end

  def new
    @planet = Planet.find(params[:planet_id])
    @booking = Booking.new
  end

  def create
    @planet = Planet.find(params[:planet_id])
    @booking = Booking.new(booking_params)
    @booking.planet = @planet
    @booking.visitor = current_user
    if @booking.save
      redirect_to bookings_path
    else
      render 'planets/show', status: :unprocessable_entity
    end
  end

  def confirm
    @booking = Booking.find(params[:id])
    @booking.update(status: "Confirmed")
    redirect_to bookings_path
  end

  def decline
    @booking = Booking.find(params[:id])
    @booking.update(status: "Unconfirmed")
    redirect_to bookings_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path, status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
