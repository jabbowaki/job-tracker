class WelcomeController < ApplicationController

  def index
    if signed_in?
      redirect_to opportunities_path
    end
  end

end