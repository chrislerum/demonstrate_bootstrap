class BottlesController < ApplicationController
  #before_action :authenticate_user!, except: [:index]

  def index
    @bottles = Bottle.all
  end

  def show
    @bottle = Bottle.find(params[:id])
  end
end
