class UsersController < ApplicationController
	def create
		user = User.new user_params
		user.save
    
    redirect_to root_path    
  end
  
  private

  def user_params
    params.required(:user).permit(:first_name, :last_name, :role, :email)
  end
end
