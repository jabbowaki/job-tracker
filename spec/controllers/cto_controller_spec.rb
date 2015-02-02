require 'rails_helper'

describe CtosController do
  let!(:user) {User.create!(first_name: "Test", last_name: "McTest", email: "test@gmail.com", password: "thisisatest")}
  let!(:opp) {Opportunity.create!(user: user, name: "Average company", website: "www.average.com")}

  describe 'GET #new' do
    it 'assigns @opportunity to specific opportunity' do
      get :new, { opportunity_id: opp.to_param }
      expect(assigns(:opportunity)).to eq(opp)
    end
  end

  describe 'POST #create' do
    it 'assigns @opportunity to a specific opp' do
      get :new, { opportunity_id: opp.to_param }
      expect(assigns(:opportunity)).to eq(opp)
    end

    it 'assigns @cto a new, unsaved cto' #do
      # cto_params = {cto: {name: "John Doe", email: "john@gmail.com"}}
      # post :create, cto_params
      # expect(assigns(:cto)).to eq(cto)
    # end

    it 'saved cto when passed valid params'
    it 'fails to save cto when passed invalid params'
    it 'renders new if cto is not saved'
  end

end