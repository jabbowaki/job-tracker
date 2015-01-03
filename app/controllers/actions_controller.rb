class ActionsController < ApplicationController

  def new
    @action = Action.new
  end

  def show
  end

  def create
    @user = current_user
    @opportunity = Opportunity.find(params[:opportunity_id])
    @action = @opportunity.actions.new(params[:actions])
    if @action.save
      redirect_to actions_path
    else
      render 'new'
    end
  end


end
