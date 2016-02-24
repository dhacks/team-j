class UsersController < ApplicationController

def show
   @lunchrequests = Lunchrequest.where(user_id: current_user.id).order("created_at DESC")
end


end
