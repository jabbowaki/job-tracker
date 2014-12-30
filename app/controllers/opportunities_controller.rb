class OpportunitiesController < ApplicationController

  def index
    @user = User.find(session[:user_id])
    @opportunities = @user.opportunities
  end

  def show
    @opportunity = Opportunity.find(params[:id])
  end
end
