class ItinerariesController < ApplicationController
  before_action :search, :find_parks, :find_restaurants, only: %i[new create]

  def index
    @itineraries = current_user.itineraries
  end

   def show
    @itinerary = find_itinerary
  end

  def new; end
  
  def create
    itinerary = current_user.itineraries.new(itinerary_params)
    if itinerary.save
      @parks.each { |park| itinerary.parks.create!(park) }
      @restaurants.each { |restaurant| itinerary.restaurants.create!(restaurant) }
      flash[:success] = "New itinerary saved."
      redirect_to itinerary_path(itinerary.id)
    else
      flash[:error] = itinerary.errors.full_messages.uniq * ', '
      redirect_to new_itinerary_path
    end
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
    @search = itinerary_params[:search].capitalize
  end

  def find_parks
    @parks = ParksService.parks_near(@search)
  end

  def find_restaurants
    @restaurants = RestaurantsService.restaurants_near(@search)
  end
end