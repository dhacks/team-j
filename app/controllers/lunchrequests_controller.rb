class LunchrequestsController < ApplicationController


  before_action :move_to_index, except: :index

  def index
    @lunchrequests = Lunchrequest.all
    @q = Lunchrequest.search(params[:q])
    @products = @q.result(distinct: true)
  end

  def new 
  end

  def create
    Lunchrequest.create(date: lunchrequest_params[:date], time: lunchrequest_params[:time], place: lunchrequest_params[:place], pepole: lunchrequest_params[:pepole], user_id: current_user.id)
  end


# イベント詳細ページへのリンク
  def show
    @lunchrequest = Lunchrequest.find(params[:id])
    render 'detail'
  end

  private
  def lunchrequest_params
    params.permit(:date, :time, :place, :pepole)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
