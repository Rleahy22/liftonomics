class DaysController < ApplicationController

  def create
    @week = Week.find(params[:week][:id])
    day_number = params[:day][:dayNumber]
    @day = Day.create(day_number: day_number, week_id: @week.id)
    render json: @day
  end
end
