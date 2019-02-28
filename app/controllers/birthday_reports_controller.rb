class BirthdayReportsController < ApplicationController
  def index 
    load_users 
    render json: UserSerializer.new(@users).serializable_hash
  end 

  private 

  def load_users 
    @users = if params[:month] 
               current_user.church.servants.by_month(params[:month])
             else 
               current_user.church.servants.by_month 
             end 
  end 
end
