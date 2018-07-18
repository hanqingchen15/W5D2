class SessionsController < ApplicationController
  
  def new
    render :new
  end
  
  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user 
      log_in!(@user)
      redirect_to subs_url
    else 
      flash[:errors] = ["Incorrect Login Information or User Does Not Exist ;[ "]
      render :new
    end
  end
  
  def destroy
    logout!
    redirect_to new_session_url
  end
end