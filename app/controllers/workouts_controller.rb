class WorkoutsController < ApplicationController

  def new
    @user = current_user
    @workout = @user.workouts.new
  end

  def create
    @workout = current_user.workouts.build(workout_params)
    if @workout.save
      flash[:success] = "Workout Created"
      redirect_to user_workout_path(current_user, @workout)
    else
      redirect_to current_user
    end
  end

  def show
    @workout = current_user.workouts.find(params[:id])
  end

  private

    def workout_params
      params.require(:workout).permit!
    end
end
