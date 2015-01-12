class ActionsController < ApplicationController

  def new
    @action = Action.new
    @opportunity = Opportunity.find(params[:opportunity_id])
    @advocates_array = []
    @opportunity.advocates.each do |advocate|
      @advocates_array << advocate.name
    end
    @advocates_array
  end

  def show
  end

  def create
    @user = current_user
    @opportunity = Opportunity.find(params[:opportunity_id])
    @action = @opportunity.actions.new(actions_params)
    @action.advocate = Advocate.find_by(name:params[:actions][:advocates])
    if @action.save
      redirect_to opportunity_path(@opportunity)
    else
      render 'new'
    end
  end

  private
    def actions_params
      params.require(:actions).permit(:description, :meeting_date, :follow_up, :notes)
    end

end
