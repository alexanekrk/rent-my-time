class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
  end

  def new
    @booking = Booking.new
    @pigeon = Pigeon.find(params[:pigeon_id])
  end

  def create
    start = params[:booking]['start_date']
    end_d = params[:booking]['end_date']
    location = params[:booking][:location]
    pigeon = params[:pigeon_id]
    @booking = Booking.new(start_date: start, end_date: end_d , location: location, user_id: current_user.id, pigeon_id: pigeon )
    @booking.save
    redirect_to bookings_path
  end

  def rent_from
    @bookings = Booking.all
  end

  def rent_to
    @bookings = Booking.all
  end
end
