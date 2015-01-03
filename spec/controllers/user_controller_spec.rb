require 'rails_helper'

describe UsersController do
  let!(:user) {User.create!(first_name: "Test", last_name: "McTest", email: "test@gmail.com", password: "thisisatest")}

  describe "POST #create" do
    context "when valid params are passed" do
      it 'creates a new user' do
        user_params = {user: {first_name: "Stuff", last_name:"Things", email: "stuff@gmail.com", password: "password"} }
        expect{ post :create, user_params}.to change{User.count}.by(1)
      end

      it "assigns a newly created user as @user" do
        user_params = {user: {first_name: "George", last_name:"Lucas", email: "starwards@gmail.com", password: "password"} }
        post :create, user_params
        expect(assigns(:user)).to eq(User.last)
      end
    end
  end

end