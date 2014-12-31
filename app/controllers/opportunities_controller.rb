class OpportunitiesController < ApplicationController

  def index
    @user = current_user
    @opportunities = @user.opportunities
  end

  def show
    @opportunity = Opportunity.find(params[:id])
  end
end
