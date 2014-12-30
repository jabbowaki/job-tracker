require 'rails_helper'

describe Advocate do
  describe 'validations' do
    it 'should require a name' do
      ad = Advocate.new(email: "steve@apple.com", twitter: "@stevejobs", blog: "stevejobs.com")
      expect(ad.save).to be_falsey
    end

    it 'should require an email' do
      ad = Advocate.new(name: "Steve Jobs", twitter: "@stevejobs", blog: "stevejobs.com")
      expect(ad.save).to be_falsey
    end

    it 'should save when passed valid params' do
      ad = Advocate.new(name: "Steve Jobs", email: "steve@apple.com", twitter: "@stevejobs", blog: "stevejobs.com")
      expect(ad.save).to be
    end
  end
end