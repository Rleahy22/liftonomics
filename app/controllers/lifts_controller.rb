class LiftsController < ApplicationController

  def index
    @lifts = Lift.search(params[:search])
    @lifts = @lifts[0..4]
    render json: @lifts
  end
end
