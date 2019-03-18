class BibleStudyMeetingsController < ApplicationController
  before_action :load_bible_study

  def index 
    load_bible_study_meetings
    render json: BibleStudyMeetingSerializer.new(@bible_study_meetings).serializable_hash
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

  private

  def load_bible_study
    @bible_study = BibleStudy.find(params[:bible_study_id])
  end

  def load_meeting
    @meeting = @bible_study.bible_study_meetings.find(params[:id])
  end

  def load_bible_study_meetings
    @bible_study_meetings = if params[:date] 
                              @bible_study.bible_study_meetings.by_date(params[:date])
                            elsif params[:year] 
                              @bible_study.bible_study_meetings.by_year(params[:year])
                            else 
                              @bible_study.bible_study_meetings.latest 
                            end
  end 

  def build_meeting
    @meeting ||= @bible_study.bible_study_meetings.new
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
    render json: BibleStudyMeetingSerializer.new(@meeting).serializable_hash
  end

  def render_meeting_errors
    render json: {
      error: @meeting.errors.full_messages.to_sentence
    }, status: :bad_request
  end

  def meeting_params
    params.require(:bible_study_meeting).permit(:name, :start_date, :end_date, :from, :to, :repeat)
  end
end
