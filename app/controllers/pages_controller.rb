class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @pigeons = Pigeon.all
  end

  def search
    @pigeons = Pigeon.all
    @pigeons = Pigeon.where(city: 'Paris')
    raise
  end
end
