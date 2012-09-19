class RolesController < ApplicationController

  before_filter :authenticate_user!

  def update

    @role = Role.find(params[:id]).tap do |role|
      role.update_attributes!(permitted_params.role)
    end

    respond_to do |format|
      format.js { render layout: false }
    end
  end

end
