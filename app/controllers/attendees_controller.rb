class AttendeesController < ApplicationController
  before_action :load_event

  def create
    build_attendee
    save_attendee
  end

  def update
    load_attendee
    build_attendee
    save_attendee
  end
  
  def destroy
    load_attendee
    @attendee.destroy
    render_attendee
  end

  private

  def load_event
    @event = Event.find(params[:event_id])
  end
  
  def load_attendee
    @attendee = @event.attendees.find(params[:id])
  end

  def build_attendee
    @attendee ||= @event.attendees.new
    @attendee.attributes = attendee_params
  end
  
  def save_attendee
    if @attendee.save
      render_attendee
    else
      render_attendee_errors
    end
  end
  
  def render_attendee
    render json: AttendeeSerializer.new(@attendee).serializable_hash
  end
  
  def render_attendee_errors
    render json: {
      error: @attendee.errors.full_messages.to_sentence
      }, status: :bad_request
    end
    
  def attendee_params
    params.require(:attendee).permit(:user_id, :pray_before_service, :attend_time, :preparation, :lecturing, :missing_by_phone, :missing_by_visit, :osra_preparing_meeting)
  end
end
