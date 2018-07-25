class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params).save
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to '/signup'
    end
  end

  def show
  end


  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end


  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
