class ConferencesController < ApplicationController
  def index
    load_conferences
    render json: ConfereceSerializer.new(@conferences).serializable_hash
  end

  def show
    load_conference
    render_conference
  end

  def create
    build_conference
    save_conference
  end

  def update
    load_conference
    build_conference
    save_conference
  end

  def destroy
    load_conference
    @conference.destroy
    render_conference
  end

  private

  def load_conferences
    @conferences = Conference.all
  end

  def load_conference
    @conference = Conference.find(params[:id])
  end

  def build_conference
    @conference ||= Conference.new
    @conference.attributes = conference_params
  end

  def save_conference
    if @conference.save
      render_conference
    else
      render_conference_errors
    end
  end

  def render_conference
    render json: ConferenceSerializer.new(@conference).serializable_hash
  end

  def render_conference_errors
    render json: {
      error: @conference.errors.values.join(', ')
    }, status: :bad_request
  end

  def conference_params
    params.require(:conference).permit(
      :name, :price, :place, :no_of_servants,
      conference_servants_attributes: %i[id user_id _destroy]
    )
  end
end
