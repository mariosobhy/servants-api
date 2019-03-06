class SpiritualDaysController < ApplicationController
  def index
    load_spiritual_days
    render json: SpiritualDaySerializer.new(@spiritual_days).serializable_hash
  end

  def show
    load_spiritual_day
    render_spiritual_day
  end

  def create
    build_spiritual_day
    save_spiritual_day
  end

  def update
    load_spiritual_day
    build_spiritual_day
    save_spiritual_day
  end

  def destroy
    load_spiritual_day
    @spiritual_day.destroy
    render_spiritual_day
  end

  private

  def load_spiritual_days
    @spiritual_days = if params[:date] 
                        SpiritualDay.by_date(params[:date])
                      elsif params[:year]
                        SpiritualDay.by_year(params[:year])
                      else     
                        SpiritualDay.latest
                      end 
  end

  def load_spiritual_day
    @spiritual_day = SpiritualDay.find(params[:id])
  end

  def build_spiritual_day
    @spiritual_day ||= SpiritualDay.new
    @spiritual_day.attributes = spiritual_day_params
  end

  def save_spiritual_day
    if @spiritual_day.save
      render_spiritual_day
    else
      render_spiritual_day_errors
    end
  end

  def render_spiritual_day
    render json: SpiritualDaySerializer.new(@spiritual_day).serializable_hash
  end

  def render_spiritual_day_errors
    render json: {
      error: @spiritual_day.errors.values.join(', ')
    }, status: :bad_request
  end

  def spiritual_day_params
    params.require(:spiritual_day).permit(
      :name, :price, :osra_id, :start_date, :end_date, :place, :no_of_servants,
      spiritual_day_servants_attributes: %i[id user_id _destroy]
    )
  end
end
