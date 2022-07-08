class HotelsController < ApplicationController
  def index
    @hotels = Hotel.all.most_recently_created
  end

  def show
    @hotel = Hotel.find(params[:id])
  end
end
