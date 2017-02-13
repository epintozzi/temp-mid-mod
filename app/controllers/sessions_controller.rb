class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      flash[:success] = "You have successfully logged in."
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:alert] = "There was a problem logging in. Please try again."
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:success] = "You have successfully logged out."
    redirect_to root_path
  end

end
