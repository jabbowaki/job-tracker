class AdvocatesController < ApplicationController

  def new
    @opportunity = Opportunity.find(params[:opportunity_id])
  end

  def create
    @opportunity = Opportunity.find(params[:opportunity_id])
    @advocate = @opportunity.advocates.new(advocate_params)
    if @advocate.save
      redirect_to opportunity_path(@opportunity)
    else
      render 'new'
    end
  end

  def update
  end

  def destroy
  end

  private
    def advocate_params
      params.require(:advocate).permit(:name, :email, :twitter, :blog)
    end
end
