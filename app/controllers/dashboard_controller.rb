class DashboardController < ApplicationController
  #load_and_authorize_resource

  def member
    authorize! :view_dashboard, :member
  end

  def admin
    @user = User.new
    authorize! :view_dashboard, :admin 
  end

  def index
    if current_user.nil?
      redirect_to new_user_session_path   
    else
      if current_user.admin?
        redirect_to admin_dashboard_path 
      elsif current_user.super_admin?
        redirect_to rails_admin_path
      else
        redirect_to member_dashboard_path
      end
    end
  end

  def logout
    redirect_to destroy_user_session_path, method: :delete
  end
end
