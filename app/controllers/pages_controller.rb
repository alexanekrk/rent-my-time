class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :search]

  def home
    @pigeons = Pigeon.all
  end

  def search
    @pigeons = Pigeon.where(address: params[:search][:query])

    @markers = @pigeons.geocoded.map do |pigeon|
      {
        lat: pigeon.latitude,
        lng: pigeon.longitude
      }
    end
  end
end
