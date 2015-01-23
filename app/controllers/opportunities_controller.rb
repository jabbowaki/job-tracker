class OpportunitiesController < ApplicationController

  def index
    @user = current_user
    @opportunities = @user.opportunities
    @recent_actions = Action.past
    @upcoming_actions = Action.upcoming

  end

  def new
    @user = current_user
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
    @user = current_user
    if params[:opp_id]
      @opportunity = Opportunity.find(params[:opportunity_id])
    else
    #@advocate = Advocate.find(params[:id])
      @opportunity = Opportunity.find(params[:id])
    end
    #@opportunity = Opportunity.find(@advocate.opportunity.id)
    @actions = @opportunity.actions
    @advocates = @opportunity.advocates
  end

  private

    def opportunity_params
      params.require(:opportunities).permit(:name, :website, :career_page, :notes)
    end

end
