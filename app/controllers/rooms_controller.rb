class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    room = Room.find(params[:id])
    room.update(room_params)
    redirect_to "/rooms/#{room.id}"
  end

  def show
    @room = Room.find(params[:id])
  end

private
  def room_params
    params.permit(:name, :occupied, :guest_count)
  end
end
