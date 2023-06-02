class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
    @pigeon = Pigeon.find(@booking.pigeon_id)
    @seller = User.find(@pigeon.user_id)
    @buyer = User.find(@booking.user_id)
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
    redirect_to :rent_from
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.delete
    redirect_to rent_to_path
  end

  def rent_from
    @bookings = Booking.all
  end

  def rent_to
    @bookings = Booking.all
  end

  def approve
    @booking = Booking.find(params[:id])
    @approved = params[:approved].to_i
    if @approved == 1
      @booking.approved = true
    else
      @booking.approved = false
    end
    @booking.save
    redirect_to rent_to_path
  end
end
