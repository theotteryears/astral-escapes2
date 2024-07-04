class PlanetsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_planet, only: :show


  def index
    planets = Planet.all
    @planets = planets.order('name ASC')
    if params[:query].present?
      sql_subquery = "name ILIKE :query OR distance ILIKE :query OR location ILIKE :query OR details ILIKE :query"
      @planets = Planet.where(sql_subquery, query: "%#{params[:query]}%")
    end
  end

  def show
    @booking = Booking.new
    @rating = Review.new
    @reviews = @planet.reviews
    @average_rating = @reviews.average(:rating)
  end

  def new
    @planet = Planet.new
  end

  def create
    @planet = Planet.new(planet_params)
    @planet.user = current_user
    if @planet.save!
      redirect_to planet_path(@planet)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_planet
    @planet = Planet.find(params[:id])
  end

  def planet_params
    params.require(:planet).permit(:name, :details, :location, :distance, :price_per_night, :planet_img)
  end
end
