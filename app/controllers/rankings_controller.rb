class RankingsController < ApplicationController

  def index
    @users = User.all
    @q=User.order(like: :desc).limit(3)
  end

end

