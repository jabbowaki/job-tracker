class OpportunitiesController < ApplicationController

  def index
    @user = current_user
    @opportunities = @user.opportunities
    #after adding association, should be Action.find_by(user: current_user).recent
    @actions = Action.recent
  end

  def new
  end

  def create
    @user = current_user
    @opp = @user.opportunities.new(opportunity_params)
    if @opp.save
      redirect_to opportunities_path
    else
      render 'new'
    end
  end

  def show
    @opportunity = Opportunity.find(params[:id])
    @actions = @opportunity.actions
  end

  private

    def opportunity_params
      params.require(:opportunities).permit(:name, :website, :career_page, :notes)
    end

end
