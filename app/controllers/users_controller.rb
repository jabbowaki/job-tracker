class UsersController < ApplicationController

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url
    else
      flash.now[:error] = "Could not signup.  Please fill in all fields"
      render 'welcome/index'
    end
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end

end
