class CoursesController < ApplicationController
  def index
    load_courses
    render json: CourseSerializer.new(@courses).serializable_hash
  end

  def show
    load_course
    render_course
  end

  def create
    build_course
    save_course
  end

  def update
    load_course
    build_course
    save_course
  end

  def destroy
    load_course
    @course.destroy
    render_course
  end

  private

  def load_courses
    @courses = Course.all
  end

  def load_course
    @course = Course.find(params[:id])
  end

  def build_course
    @course ||= Course.new
    @course.attributes = course_params
  end

  def save_course
    if @course.save
      render_course
    else
      render_course_errors
    end
  end

  def render_course
    render json: CourseSerializer.new(@course).serializable_hash
  end

  def render_course_errors
    render json: {
      error: @course.errors.values.join(', ')
    }, status: :bad_request
  end

  def course_params
    params.require(:course).permit(
      :name, :no_of_lectures, :user_id, :total_score,
      course_servants_attributes: %i[id user_id _destroy],
      lectures_attributes: %i[id name start_time end_time course_id _destroy]
    )
  end
end
