class PigeonsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @pigeons = Pigeon.all
  end

  def show
    @pigeon = Pigeon.find(params[:id])
  end

  def new
    @pigeon = Pigeon.new
  end

  def create
    @pigeon = Pigeon.new(params_pigeon)
    if @pigeon.save
        redirect_to pingeon_path(@pigeon)
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
      redirect_to pingeon_path(@pigeon)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @pigeon = Pigeon.find(params[:id])
    @pigeon.destroy
    redirect_to pingeon_path(@pigeon)
  end

  private

  def params_pigeon
    params.require(:pigeon).permit(:name, :color, :price, :age)
  end
end
