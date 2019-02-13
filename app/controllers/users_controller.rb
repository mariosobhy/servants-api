class UsersController < ApplicationController
  def index
    load_users
    render json: @users
  end

  def show
    load_user
    render json: @user
  end

  def create
    build_user
    save_user
  end

  def update
    load_user
    build_user
    save_user
  end

  def destroy
    load_user
    @user.destroy
    render json: @user
  end

  private

  def load_users
    @users = current_user.church.servants
  end

  def load_user
    @user = current_user.church.servants.find(params[:id])
  end

  def build_user
    @user ||= User.new
    @user.attributes = user_params
  end

  def save_user
    if @user.save
      render json: @user
    else
      render_user_errors
    end
  end

  def render_user_errors
    render json: {
      error: @user.errors.full_messages.to_sentence
    }, status: :bad_request
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confrimation, :mobile_number, :birth_date, :confession_date, :holymass_date, :tnawol_date)
  end
end
