class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
    @pigeon = Pigeon.find(params[:pigeon_id])
  end

  def create
    year = params[:booking]['date(1i)']
    month = params[:booking]['date(2i)']
    day = params[:booking]['date(3i)']
    date = "#{day}-#{month}-#{year}"
    date = Date.strptime(date, '%d-%m-%Y')
    location = params[:booking][:location]
    pigeon = params[:pigeon_id]
    @booking = Booking.new(date: date, location: location, user_id: current_user.id, pigeon_id: pigeon )
    @booking.save
    redirect_to bookings_path
  end
end
