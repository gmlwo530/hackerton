class LoginController < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

def create
  User.create(username: params[:username],
                    email: params[:email],
                     password: params[:password],
                     password_confirmation: params[:password_confirmation])
  redirect_to :root
end

end