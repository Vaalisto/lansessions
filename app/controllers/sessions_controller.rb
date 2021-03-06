class SessionsController < ApplicationController
  def new
    
  end

  def create
    
    user = User.find_by username: params[:username]
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id if not user.nil?    
      redirect_to user_path(user), notice: "Welcome back!"
    else
      redirect_to :back, notice: "Check your username and/or password"
    end
  end

  def destroy    
    session[:user_id] = nil   
    redirect_to :root, notice: "Signed out!"
  end
end