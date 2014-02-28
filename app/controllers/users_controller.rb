class UsersController < ApplicationController
  def new
    if signed_in?
      @user = current_user
      redirect_to @user
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Gym"
      sign_in(@user)
      redirect_to  @user
    else
      redirect_to root_path
    end
  end

  def show
    @user = User.find(params[:id])

  end

  def edit
  end

  private

    def user_params
      params.require(:user).permit!
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
