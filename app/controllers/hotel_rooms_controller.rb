class HotelRoomsController < ApplicationController
  def index
    hotel = Hotel.find(params[:hotel_id])
    @rooms = hotel.rooms
  end
end
