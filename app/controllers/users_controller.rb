class UsersController < ApplicationController


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "You have successfully created an account"
      redirect_to root_path
    else
      flash[:alert] = "There was a problem. #{@user.errors.full_messages.join(' ')}. Please try again."
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:id, :email, :password, :password_confirmation)
  end

end
