class SessionsController < ApplicationController
  before_action :valid?, except: [:new, :create, :destroy]
  
  def new
    if session[:user]
      redirect_to director_path(user)
    end
  end

  def create
    user = Director.find_by(username: params[:username])
    if user 
      if user.authenticate(params[:password])
        session[:user] = user
        redirect_to director_path(user)
      else
        flash[:message] = "Password is incorrect"
        redirect_to login_path
      end
    else
      flash[:message] = "Username could not be found"
      redirect_to login_path
    end
  end

  def logout
    session[:user] = nil
    redirect_to login_path
  end

end
