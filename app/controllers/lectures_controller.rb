class LecturesController < ApplicationController
  before_action :load_course
  before_action :load_lectures, only: %i[index]
  before_action :load_lecture, only: %i[show update destroy]
  before_action :build_lecture, only: %i[create update]

  def index
    render json: LectureSerializer.new(@lectures).serializable_hash
  end

  def show
    render_lecture
  end

  def create
    save_lecture
  end

  def update
    save_lecture
  end

  def destroy
    @lecture.destroy
    render_lecture
  end

  def import 
  end 

  def export 
    load_lectures
    send_data @lectures.to_csv, file_name: "lectures-#{Date.today}.csv"
  end 

  private

  def load_lectures
    @lectures = if params[:year]
                  @course.lectures.by_year(params[:year])
                else 
                  @course.lectures.latest
                end 
  end

  def load_lecture
    @lecture = @course.lectures.find(params[:id])
  end

  def load_course 
    @course = Course.find(params[:course_id])
  end 

  def build_lecture
    @lecture ||= Lecture.new
    @lecture.attributes = lecture_params
    @lecture.course = @course
  end

  def save_lecture
    if @lecture.save
      render_lecture
    else
      render_lecture_errors
    end
  end

  def render_lecture
    render json: LectureSerializer.new(@lecture).serializable_hash
  end

  def render_lecture_errors
    render json: {
      error: @lecture.errors.values.join(', ')
    }, status: :bad_request
  end

  def lecture_params
    params.require(:lecture).permit(:id, :name, :start_time, :end_time, :course_id, 
                                    topics_attributes: %i[id name content],
                                    material_links_attributes: %i[id label url])
  end
end
