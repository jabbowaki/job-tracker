require 'rails_helper'

describe Opportunity do
  describe 'validations' do
    it 'should save when passed valid params' do
      user = User.create(first_name: "Emily", last_name: "Owaki", email: "emily@gmail.com", password: "password")
      opp = Opportunity.new(user: user, name: "Google", website: "www.google.com")
      expect(opp.save).to be_truthy
    end

    it 'should not save when missing a user' do
      opp = Opportunity.new(name: "Google", website: "www.google.com")
      expect(opp.save).to be_falsey
    end

    it 'should not save when missing a name' do
      user = User.create(first_name: "Emily", last_name: "Owaki", email: "emily@gmail.com", password: "password")
      opp = Opportunity.new(user: user, website: "www.google.com")
      expect(opp.save).to be_falsey
    end

    it 'should not save when missing a website' do
      user = User.create(first_name: "Emily", last_name: "Owaki", email: "emily@gmail.com", password: "password")
      opp = Opportunity.new(user: user, name: "Google")
      expect(opp.save).to be_falsey
    end

    it 'should not save when there is a company with the same name' do
      user = User.create(first_name: "Emily", last_name: "Owaki", email: "emily@gmail.com", password: "password")
      Opportunity.create(user: user, name: "Facebook", website: "www.facebook.com")
      opp = Opportunity.new(user: user, name: "Facebook", website: "facebook.com")
      expect(opp.save).to be_falsey
    end
  end
end