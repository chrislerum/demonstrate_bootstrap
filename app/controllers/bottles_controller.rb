class BottlesController < ApplicationController
  def index
    @bottles = Bottle.all
  end
  def show
    @bottle = Bottle.find(params[:id])
    Bottle.do_the_work(3, 5)
  end
end
