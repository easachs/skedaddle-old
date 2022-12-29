# frozen_string_literal: true

class ItinerariesController < ApplicationController
  before_action :search, :find_parks, :find_restaurants, only: %i[new create]
  before_action :not_logged_in

  def index
    @itineraries = current_user.itineraries
  end

  def show
    @itinerary = find_itinerary
  end

  def new
    if params[:search] == ('') || nil
      redirect_to '/dashboard'
      flash[:error] = 'Search cannot be empty!'
    elsif @found_parks.empty? && @found_restaurants.empty?
      redirect_to '/dashboard'
      flash[:error] = 'No results found!'
    end
  end

  def create
    itinerary = current_user.itineraries.new(itinerary_params)
    return unless itinerary.save

    @found_parks.each { |park| itinerary.parks.create!(park.serialized) }
    @found_restaurants.each { |restaurant| itinerary.restaurants.create!(restaurant.serialized) }
    flash[:success] = 'New itinerary saved.'
    redirect_to itinerary_path(itinerary.id)
  end

  def destroy
    find_itinerary.destroy!
    redirect_to itineraries_path
  end

  private

  def itinerary_params
    params.permit(:search)
  end

  def find_itinerary
    Itinerary.find(params[:id])
  end

  def search
    @search = itinerary_params[:search].capitalize.delete("'")
  end

  def find_parks
    @found_parks = ParksFacade.parks_near(@search)
  end

  def find_restaurants
    @found_restaurants = RestaurantsFacade.restaurants_near(@search)
  end

  def not_logged_in
    return unless current_user == (nil)

    redirect_to root_path
    flash[:error] = 'Must be logged in!'
  end
end
