class UsersController < ApplicationController
  def create
    if User.create(params[:user])
      redirect_to root_path
    end    
  end
end
