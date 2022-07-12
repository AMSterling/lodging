class HotelRoomsController < ApplicationController
  def index
    @hotel = Hotel.find(params[:hotel_id])
    if params[:sort] == "alpha"
      @rooms = @hotel.rooms.alphabetical
    else
      @rooms = @hotel.rooms
    end
  end

  def new
    @hotel = Hotel.find(params[:hotel_id])
  end

  def create
    @hotel = Hotel.find(params[:hotel_id])
    @hotel.rooms.create(room_params)
    redirect_to "/hotels/#{@hotel.id}/rooms"
  end

private
  def room_params
   params.permit(:name, :occupied, :guest_count)
  end
end
