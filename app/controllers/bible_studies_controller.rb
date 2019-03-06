class BibleStudiesController < ApplicationController
  def index
    load_bible_studies
    render json: BibleStudySerializer.new(@bible_studies).serializable_hash
  end

  def show
    load_bible_study
    render_bible_study
  end

  def create
    build_bible_study
    save_bible_study
  end

  def update
    load_bible_study
    build_bible_study
    save_bible_study
  end

  def destroy
    load_bible_study
    @bible_study.destroy
    render_bible_study
  end

  private

  def load_bible_studies
    @bible_studies = if params[:year] 
                       BibleStudy.by_year(params[:year])
                     else 
                       BibleStudy.latest
                     end 
  end

  def load_bible_study
    @bible_study = BibleStudy.find(params[:id])
  end

  def build_bible_study
    @bible_study ||= BibleStudy.new
    @bible_study.attributes = bible_study_params
  end

  def save_bible_study
    if @bible_study.save
      render_bible_study
    else
      render_bible_study_errors
    end
  end

  def render_bible_study
    render json: BibleStudySerializer.new(@bible_study).serializable_hash
  end

  def render_bible_study_errors
    render json: {
      error: @bible_study.errors.values.join(', ')
    }, status: :bad_request
  end

  def bible_study_params
    params.require(:bible_study).permit(
      :name, :user_id, :total_score,
      bible_study_servants_attributes: %i[id user_id _destroy]
    )
  end
end
