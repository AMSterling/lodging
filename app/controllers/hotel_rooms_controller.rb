class HotelRoomsController < ApplicationController
  def index
    @hotel = Hotel.find(params[:hotel_id])
    if params[:sort] == "alpha"
      @rooms = @hotel.rooms.alphabetical
    elsif params[:rooms_with_more_than]
      @rooms = @hotel.rooms_with_more_than(params[:rooms_with_more_than])
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
