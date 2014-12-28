class WelcomeController < ApplicationController

  def index

    # @user = User.find(session[:user_id])
    if session[:user_id]
      redirect_to opportunities_path
    end

  end
end