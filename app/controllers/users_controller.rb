class UsersController < ApplicationController
	before_action :set_user, only: [:show, :add_picture, :update_picture]
  
  def show
  end

  def add_picture
  end

  def update_picture
  	if @user.update(user_params)
  		redirect_to @user, notice: "Profile Picture Added!"
  	else
  		render "add_picture"
  	end
  end

  private 
  def set_user 
  	@user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:image)
  end
end
