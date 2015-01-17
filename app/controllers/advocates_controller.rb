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

  def edit
    @opportunity = Opportunity.find(params[:opportunity_id])
    @advocate = Advocate.find(params[:id])
  end

  def update
    @opportinuty = Opportunity.find(params[:opportunity_id])
    @advocate = Advocate.find(params[:id])
    @advocate.attributes = {name: params[:advocate][:name], email: params[:advocate][:email], twitter: params[:advocate][:twitter], blog: params[:advocate][:blog]}
    if @advocate.save
      redirect_to opportunity_path
    else
      render 'edit'
    end
  end

  def destroy
  end

  private
    def advocate_params
      params.require(:advocate).permit(:name, :email, :twitter, :blog)
    end
end
