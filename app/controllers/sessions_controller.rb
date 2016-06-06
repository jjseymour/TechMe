require 'google/api_client'

class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def google_auth
    #session[:user_id] = User.last.id 
    @user = User.find(session[:user_id])
    @user.add_omniauth_params(request.env["omniauth.auth"])
    redirect_to user_path(@user) 

    # @auth = request.env["omniauth.auth"]
    # #Use the token from the data to request a list of calendars
    # @token = @auth["credentials"]["token"]
    # client = Google::APIClient.new
    # client.authorization.access_token = @token
    # service = client.discovered_api('calendar', 'v3')
    # @result = client.execute(
    #   :api_method => service.calendar_list.list,
    #   :parameters => {},
    #   :headers => {'Content-Type' => 'application/json'})
  end

  def create
    #@user = User.from_omniauth(request.env["omniauth.auth"])

    @user = User.find_by(username: params[:user][:username])
    
    # if login_url(params[:username], params[:password])
    #   redirect_back fallback_location: users_path
    #   @user = User.find_by(username: params[:user][:username])
    # else
    #   flash.now.alert = "Login failed."
    #   render action: :new
    # end
    #binding.pry

    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
    #What data comes back from OmniAuth?     
    
      redirect_to user_path(@user)
    else
      flash[:alert] = "Login Failed, bro"
      redirect_to login_path
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
