class CtosController < ApplicationController
  def new
    @opportunity = Opportunity.find(params[:opportunity_id])
  end

  def create
    @opportunity = Opportunity.find(params[:opportunity_id])
    @cto = Cto.new(cto_params)
    if @cto.save
      redirect_to opportunity_path(@opportunity)
    else
      render 'new'
    end
  end

  private
    def cto_params
      params.require(:cto).permit(:name, :email, :twitter, :blog)
    end
end
