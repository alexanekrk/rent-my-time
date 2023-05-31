class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @pigeons = Pigeon.all
  end

  def search
    @pigeons = Pigeon.where(address: params[:search][:query])
  end
end
