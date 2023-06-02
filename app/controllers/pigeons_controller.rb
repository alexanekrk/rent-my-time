class PigeonsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @pigeons = Pigeon.all
  end

  def show
    @pigeon = Pigeon.find(params[:id])
    @booking = Booking.new
    @marker = [{ lat: @pigeon.latitude, lng: @pigeon.longitude }]
    @owner = User.find(@pigeon.user_id)
    @comment = Comment.new
  end

  def my_pigeons
    @my_pigeons = Pigeon.where(user: current_user)
  end

  def new
    @pigeon = Pigeon.new
  end

  def create
    @pigeon = Pigeon.new(params_pigeon)
    @user = current_user
    @pigeon.user = @user
    if @pigeon.save
      redirect_to pigeon_path(@pigeon)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @pigeon = Pigeon.find(params[:id])
  end

  def update
    @pigeon = Pigeon.find(params[:id])
    if @pigeon.update(params_pigeon)
      redirect_to pigeon_path(@pigeon)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @pigeon = Pigeon.find(params[:id])
    @pigeon.destroy
    redirect_to pigeons_path
  end

  private

  def params_pigeon
    params.require(:pigeon).permit(:name, :description, :color, :price, :age, :address, :photo)
  end
end
