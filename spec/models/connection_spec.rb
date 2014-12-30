require 'rails_helper'

describe Connection do
  describe 'validations' do
    it 'should save when passed valid params' do
      connect = Connection.new(advocate: Advocate.create(name:"Bob", email:"bob@gmail.com"),
        opportunity: Opportunity.create(name: "Google", website: "www.google.com"))
      expect(connect.save).to be_truthy
    end

    it 'requires an advocate' do
      connect = Connection.new(opportunity: Opportunity.create(name: "Google", website: "www.google.com"))
      expect(connect.save).to be_falsey
    end

    it 'requires an opportunity' do
      connect = Connection.new(advocate: Advocate.create(name: "Bob", email: "bob@gmail.com"))
      expect(connect.save).to be_falsey
    end
  end
end