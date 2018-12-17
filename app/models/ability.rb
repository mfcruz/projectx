class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :view_dashboard, :admin
      can :manage, User
    elsif user.super_admin?    
      can :manage, :rails_admin
    else
      can :view_dashboard, :member
    end
  end
end
