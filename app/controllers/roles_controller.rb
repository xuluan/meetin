class RolesController < ApplicationController

  before_filter :authenticate_user!

  def update
    @role = Role.find(params[:id])
    @role.update_attributes(params[:role])

    respond_to do |format|
      format.js { render :layout => false }
    end  
    
  end

end
