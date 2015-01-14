class WelcomeController < ApplicationController

  def index
    if session[:user_id]
      redirect_to opportunities_path
    end
  end

end