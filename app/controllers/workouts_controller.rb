class WorkoutsController < ApplicationController

  def new
    @user = current_user
    @workout = @user.workouts.new
  end

  def create
    weeks = params[:number_weeks].to_i
    @workout = current_user.workouts.build(workout_params)
    if @workout.save
      for x in 1..weeks
        Week.create(workout_id: @workout.id, week_number: x)
      end
      flash[:success] = "Workout Created"
      redirect_to user_workout_path(current_user, @workout)
    else
      redirect_to current_user
    end
  end

  def show
    @user = current_user
    @workout = current_user.workouts.find(params[:id])
  end

  def edit
    @user = current_user
      @workout = current_user.workouts.find(params[:id])
    if flash[:error]
      flash[:error]
    end
  end

  def update
    @workout = current_user.workouts.find(params[:id])
    if @workout.update_attributes(workout_params)
      flash[:success] = "Workout Updated"
      redirect_to user_workout_path(current_user, @workout)
    else
      flash[:error] = "Name cannot be blank"
      redirect_to edit_user_workout_path(current_user, @workout)
    end
  end

  def destroy
    @workout = current_user.workouts.find(params[:id]).destroy
    flash[:success] = "Workout Deleted"
    redirect_to current_user
  end

  private

    def workout_params
      params.require(:workout).permit!
    end
end
