require 'rails_helper'

describe Cto do

  it 'will save when passed valid params' do
    cto = Cto.new(name: "John Doe", twitter: "johndoe", blog: "www.johndoe.com", email: "johndoe@guy.com")
    expect(cto).to be_valid
  end

  it 'will not save when name is missing' do
    cto = Cto.new(twitter: "johndoe", blog: "www.johndoe.com", email: "johndoe@guy.com")
    expect(cto).to_not be_valid
  end

  it 'will not save an invalid email address' do
    cto = Cto.new(name:"John Doe", email: "johndoe@gmail")
    expect(cto).to_not be_valid
  end

end