class ChurchAdminsController < ApplicationController
  def create 
    build_church_admin
    save_church_admin
  end 

  def update 
    build_church_admin
    save_church_admin
  end 

  def destroy 
    load_church_admin
    @church_admin.destroy 
    render_church_admin
  end 

  private 

  def load_church_admin 
    @church_admin = ChurchAdmin.find(params[:id])
  end 

  def build_church_admin 
    @church_admin ||= ChurchAdmin.new 
    @church_admin.attributes = church_admin_params
  end 

  def save_church_admin 
    if @church_admin.save 
      render_church_admin 
    else 
      render_church_admin_errors 
    end 
  end 

  def render_church_admin 
    render json: ChurchAdminSerializer.new(@church_admin).serializable_hash
  end 

  def render_church_admin_errors
    render json: {
      error: @church_admin.errors.values.join(', ')
    }, status: :bad_request
  end

  def church_admin_params 
    params.require(:church_admin).permit(:church_id, :user_id, amin_osras_attributes: %i[ id osra_id user_id _destroy ])
  end 
end
