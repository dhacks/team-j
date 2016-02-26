class UsersController < ApplicationController

def show
    @user = User.find(params[:id])
    @lunchrequests = Lunchrequest.where(user_id: current_user.id).order("created_at DESC")
    #カレントゆーざとChatしていた人のユニークなidを配列で取得し，Userもでるを返す
    @rooms = User.find(Chat.where(woman_id: current_user.id).select(:man_id).distinct.pluck(:man_id))
    
  end

  def edit
  end

 def update
    current_user.update(update_params)
  end

  def like
    user = User.find(params[:id])
    user.increment_like!
  end

  private
  def update_params
    params.require(:user).permit(:name, :sex, :department, :message, :avatar)
  end


end
