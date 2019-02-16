class ChurchesController < ApplicationController
  before_action :load_church, except: %i[index create]
  before_action :load_churches, only: %i[index]
  before_action :build_church, only: %i[create update]

  def index
    render json: @churches
  end

  def show
    render json: @church
  end

  def create
    save_church
  end

  def update
    save_church
  end

  def destroy
    @church.destroy
    render json: @church
  end

  private

  def load_churches
    @churches = Church.all
  end

  def load_church
    @church = Church.find(params[:id])
  end

  def build_church
    @church ||= Church.new
    @church.attributes = church_params
  end

  def save_church
    if @church.save
      render json: @church
    else
      render_church_errors
    end
  end

  def render_church_errors
    render json: {
      error: @church.errors.full_messages.to_sentence
    }, status: :bad_request
  end

  def church_params
    params.require(:church).permit(:id, :name, :country, :city, :address)
  end
end
