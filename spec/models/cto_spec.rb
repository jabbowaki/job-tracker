require 'rails_helper'

describe Cto do
  describe 'validations' do
    it 'should save when valid params are passed' do
      cto = Cto.new(name: "Bob", email: "bob@gmail.com", twitter: "@bob", blog: "www.bobblog.com")
      expect(cto.save).to be_truthy
    end

    it 'should not save when missing cto name' do
      cto = Cto.new(email: "bob@gmail.com", twitter: "@bob", blog: "www.bobblog.com")
      expect(cto.save).to be_falsey
    end

    it 'should only accept valid emails' do
      cto = Cto.new(name: "bob", email: "bob@gmail")
      expect(cto.save).to be_falsey
    end
  end
end