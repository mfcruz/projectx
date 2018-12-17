class Admin::UsersController < ApplicationController
	def create
		user = User.new(params[:user])
		if user.save
			redirect_to root_path
		end    
	end
end
