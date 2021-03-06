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

  def edit
    @opportunity = Opportunity.find(params[:id])
  end

  def update
    @opportunity = Opportunity.find(params[:id])
    @opportunity.attributes = {name: params[:opportunity][:name], website: params[:opportunity][:website], career_page: params[:opportunity][:career_page], notes: params[:opportunity][:notes]}
    if @opportunity.save
      redirect_to opportunity_path
    else
      render 'opportunities/edit'
    end

  end

  private

    def opportunity_params
      params.require(:opportunities).permit(:name, :website, :career_page, :notes)
    end

end
