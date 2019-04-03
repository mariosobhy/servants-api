class CourseMeetingsController < ApplicationController
  before_action :load_course

  def index 
    load_course_meetings
    render json: CourseMeetingSerializer.new(@course_meetings).serializable_hash
  end 

  def show
    load_meeting
    render_meeting
  end

  def create
    build_meeting
    save_meeting
  end

  def update
    load_meeting
    build_meeting
    save_meeting
  end

  def destroy
    load_meeting
    @meeting.destroy
    render_meeting
  end

  def import 
  end 

  def export 
    load_course_meetings
    send_data @course_meetings.to_csv, file_name: "course-meetings-#{Date.today}.csv"
  end 

  private

  def load_course
    @course = Course.find(params[:course_id])
  end

  def load_meeting
    @meeting = @course.course_meetings.find(params[:id])
  end

  def load_course_meetings 
    @course_meetings = if params[:date] 
                         @course.course_meetings.by_date(params[:date])
                       elsif params[:year] 
                         @course.course_meetings.by_year(params[:year])
                       else 
                         @course.course_meetings.latest 
                       end 
  end 

  def build_meeting
    @meeting ||= @course.course_meetings.new
    @meeting.attributes = meeting_params
  end

  def save_meeting
    if @meeting.save
      render_meeting
    else
      render_meeting_errors
    end
  end

  def render_meeting
    render json: CourseMeetingSerializer.new(@meeting).serializable_hash
  end

  def render_meeting_errors
    render json: {
      error: @meeting.errors.full_messages.to_sentence
    }, status: :bad_request
  end

  def meeting_params
    params.require(:course_meeting).permit(:name, :start_date, :end_date, :from, :to, :repeat)
  end
end
