class PigeonsController < ApplicationController

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
  end

  private

  def params_pigeon
    params.require(:pigeon).permit(:name, :color, :price, :age)
  end
end
