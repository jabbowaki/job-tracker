class SessionsController < ApplicationController
  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to opportunities_path
    else
      @error_message = "Invalid email or password"
      render "welcome/index"
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
