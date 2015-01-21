class BottlesController < ApplicationController
  #before_action :authenticate_user!, except: [:index]

  def index
    @bottles = Bottle.all
  end

  def show
    @bottle = Bottle.find(params[:id])
    Bottle.do_the_work(3, 5)
  end
end
