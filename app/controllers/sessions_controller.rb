class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user.password == params[:password]
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      return head(:forbidden)
      redirect_to login_path
    end
  end
end
