class HotelRoomsController < ApplicationController
  def index
    @hotel = Hotel.find(params[:hotel_id])
    @rooms = @hotel.rooms
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
