class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      
      flash[:alert] = "Thank you for joining TechMe, bro. Your account has be activated. Please login to continue."
      redirect_to login_path
    else
      flash[:alert] = "There was an error with your registration. Please try again."
      render new_registration_path
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
