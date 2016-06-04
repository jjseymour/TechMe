class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:alert] = "Login Failed, bro"
      render :login_path
    end
  end

  def destroy
    session[:user_id] = nil
    session[:current_org] = nil
    redirect_to login_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
