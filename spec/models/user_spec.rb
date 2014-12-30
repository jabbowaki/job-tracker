require 'rails_helper'

describe User do
  let(:test) {User.new(first_name: "Bob", last_name: "Smith", email: "bob@gmail.com", password: "password")}

  describe 'validations' do
    it 'should save when params are valid' do
      expect(test.save).to be_truthy
    end

    it 'should not save when the params are invalid' do
      please_fail = User.new(first_name: "cat")
      expect(please_fail.save).to be_falsey
    end

    it 'should require unique emails' do
      cat = User.create!(first_name: "Cat", last_name: "McCaterson", email: "Cat@gmail.com", password:"catscatscats")
      dog = User.new(first_name: "Dog", last_name: "McDogerson", email: "Cat@gmail.com", password: "dogsdogsdogs")
      expect(dog.save).to be_falsey
    end

    it 'should require a valid email' do
      user = User.new(first_name: "Emily", last_name: "Owaki", email: "emily@gmail", password: "passwords")
      expect(user.save).to be_falsey
    end

    it 'should fail if password is less than 8 digits' do
      user = User.new(first_name: "Emily", last_name: "Owaki", email: "emily@gmail.com", password:"test")
      expect(user.save).to_not be
    end
  end

end
