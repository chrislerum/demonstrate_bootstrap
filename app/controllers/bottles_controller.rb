class BottlesController < ApplicationController

  def index
    @bottles = Bottle.all
  end

  def show
    @bottle = Bottle.find(params[:id])
  end
end
