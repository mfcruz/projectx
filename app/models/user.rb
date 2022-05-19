class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #before_action :authenticate_user!

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def admin?
    self.role == 'admin'
  end

  def super_admin?
    self.role == 'super_admin'
  end
end
