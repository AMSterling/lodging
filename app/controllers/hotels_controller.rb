class HotelsController < ApplicationController
  def index
    @hotels = Hotel.all.most_recently_created
  end

  def new
  end

  def create
    hotel = Hotel.create(hotel_params)
    redirect_to '/hotels'
  end

  def show
    @hotel = Hotel.find(params[:id])
  end
end

private
  def hotel_params
    params.permit(:name, :city, :booked, :capacity)
  end
