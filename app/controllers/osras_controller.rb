class OsrasController < ApplicationController
  def index
    load_osras
    render json: OsraSerializer.new(@osras).serializable_hash
  end

  def show
    load_osra
    render_osra
  end

  def create
    build_osra
    save_osra
  end

  def update
    load_osra
    build_osra
    save_osra
  end

  def destroy
    load_osra
    @osra.destroy
    render_osra
  end

  private

  def load_osras
    @osras = Osra.all
  end

  def load_osra
    @osra = Osra.find(params[:id])
  end

  def build_osra
    @osra ||= Osra.new
    @osra.attributes = osra_params
  end

  def save_osra
    if @osra.save
      render_osra
    else
      render_osra_errors
    end
  end

  def render_osra
    render json: OsraSerializer.new(@osra).serializable_hash
  end

  def render_osra_errors
    render json: {
      error: @osra.errors.full_messages.to_sentence
    }, status: :bad_request
  end

  def osra_params
    params.require(:osra).permit(:name)
  end
end
