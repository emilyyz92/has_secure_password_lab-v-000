class SessionsController < ApplicationController

  def new
  end

  def create
    binding.pry
    user = User.find_by(name: params[:user][:name])
    if user && user.password == params[:user][:password]
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      return head(:forbidden)
      redirect_to login_path
    end
  end
end
