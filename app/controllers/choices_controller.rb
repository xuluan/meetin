class ChoicesController < ApplicationController

  def create

    @choice = Choice.get_entry(params[:choice][:meeting_id], params[:choice][:user_id], params[:choice][:role_id])

    if @choice
      @choice.assign_attributes(params[:choice])
    else
      @choice = Choice.new(params[:choice])
    end


    if @choice.save
      @user = current_user
      @role = Role.find(@choice.role_id)
    end

    respond_to do |format|
      format.js { render :layout => false }
    end      
  end

end