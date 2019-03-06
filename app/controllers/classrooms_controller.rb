class ClassroomsController < ApplicationController
  before_action :load_osra

  def index
    load_classrooms
    render json: ClassroomSerializer.new(@classrooms).serializable_hash
  end

  def show
    load_classroom
    render_classroom
  end

  def create
    build_classroom
    save_classroom
  end

  def update
    load_classroom
    build_classroom
    save_classroom
  end

  def destroy
    load_classroom
    @classroom.destroy
    render_classroom
  end

  private

  def load_classrooms
    @classrooms = if params[:year] 
                    @osra.classrooms.by_year(params[:year])
                  else 
                    @osra.classrooms.latest
                  end 
  end

  def load_osra 
    @osra = Osra.find(params[:osra_id])
  end 

  def load_classroom
    @classroom = @osra.classrooms.find(params[:id])
  end

  def build_classroom
    @classroom ||= @osra.classrooms.new
    @classroom.attributes = classroom_params
  end

  def save_classroom
    if @classroom.save
      render_classroom
    else
      render_classroom_errors
    end
  end

  def render_classroom
    render json: ClassroomSerializer.new(@classroom).serializable_hash
  end

  def render_classroom_errors
    render json: {
      error: @classroom.errors.values.join(', ')
    }, status: :bad_request
  end

  def classroom_params
    params.require(:classroom).permit(
      :name, :osra_id, :user_id,
      classroom_servants_attributes: %i[id user_id _destroy]
    )
  end
end
