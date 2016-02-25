class UsersController < ApplicationController

def show
    @user = User.find(params[:id])
    @lunchrequests = Lunchrequest.where(user_id: current_user.id).order("created_at DESC")
  end

  def edit
  end

 def update
    current_user.update(update_params)
  end

  private
  def update_params
    params.require(:user).permit(:name, :sex, :department, :message, :avatar)
  end


end
