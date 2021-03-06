class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :edit_picture, :update_picture]
  before_action :authenticate_user!
  
  def show
  end

  def update

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user }
        format.json { render json: { msg: "Success" } }
      else
        format.html { redirect_to @user }
        format.json { render json: { msg: "Error" } }
      end
    end
  end

  def edit_picture
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
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The user you were looking for could not be found."
    redirect_to root_path
  end

  def user_params
    params.require(:user).permit(:image, :name, :email)
  end
end
