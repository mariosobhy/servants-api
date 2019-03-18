class OsraMeetingsController < ApplicationController
  before_action :load_osra

  def index 
    load_osra_meetings
    render json: OsraMeetingSerializer.new(@osra_meetings).serializable_hash
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

  def load_osra
    @osra = Osra.find(params[:osra_id])
  end

  def load_osra_meetings 
    @osra_meetings = if params[:date] 
                       @osra.osra_meetings.by_date(params[:date])
                     elsif params[:year] 
                       @osra.osra_meetings.by_year(params[:year])
                     else 
                       @osra.osra_meetings.latest 
                     end 
  end 

  def load_meeting
    @meeting = @osra.osra_meetings.find(params[:id])
  end

  def build_meeting
    @meeting ||= @osra.osra_meetings.new
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
    render json: OsraMeetingSerializer.new(@meeting).serializable_hash
  end

  def render_meeting_errors
    render json: {
      error: @meeting.errors.full_messages.to_sentence
    }, status: :bad_request
  end

  def meeting_params
    params.require(:osra_meeting).permit(:name, :start_date, :end_date, :from, :to, :repeat)
  end
end
