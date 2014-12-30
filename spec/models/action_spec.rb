require 'rails_helper'

describe Action do
  describe 'validations' do
    it 'should require the presence of an opportunity' do
      act = Action.new(description: "Aw yea tests")
      expect(act.save).to be_falsey
    end

    it 'should require a description' do
      @user =  User.create!(first_name: "Emily", last_name: "Owaki", email: "emily@gmail.com", password: "password")
      act = Action.new(opportunity: Opportunity.create(user: @user, name: "Google", website: "www.google.com"))
      expect(act.save).to be_falsey
    end

    it 'should save when passed valid params' do
      act = Action.new(description: "Testing", opportunity: Opportunity.create(user: @user, name: "Google", website: "www.google.com"))
      expect(act.save).to be
    end
  end
end