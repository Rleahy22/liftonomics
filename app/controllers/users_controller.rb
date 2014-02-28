class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Gym"
      redirect_to  @user
    else
      redirect_to root
    end
  end

  def show
    @user = User.find(params[:id])

  end

  private

  def user_params
    params.require(:user).permit!
  end
end