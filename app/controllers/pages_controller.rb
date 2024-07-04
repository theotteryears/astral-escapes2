class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @reviews = Review.where(params[:planet_id])
    @average_rating = @reviews.average(:rating)
    planets = Planet.all
    @planets = planets.shuffle.take(3)
  end
end
