class LiftsController < ApplicationController

  def index
    @lifts = Lift.search(params[:search])
    @lifts = @lifts[0..4]
    puts @lifts
    render json: @lifts
  end
end
