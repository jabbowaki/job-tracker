class ActionsController < ApplicationController

  def new
    @action = Action.new
  end

  def show
  end

  def create
    @user = current_user
    @opportunity = Opportunity.find(params[:opportunity_id])
    @action = @opportunity.actions.new(actions_params)
    if @action.save
      redirect_to opportunity_path(@opportunity)
    else
      render 'new'
    end
  end

  private
    def actions_params
      params.require(:actions).permit(:description, :meeting_date)
    end

end
