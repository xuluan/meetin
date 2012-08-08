class MembersController < ApplicationController
  def create
    @member = Member.new(params[:member])
    @member.save
    respond_to do |format|
      format.js { render :layout => false }
    end    
  end

  def destroy    
    @member = Member.find(params[:id])
    new_member = Member.new
    new_member.meeting_id = @member.meeting_id
    new_member.user_id = @member.user_id
    @member.destroy
    @member = new_member
    respond_to do |format|
      format.js { render :create, :layout => false }
    end
  end
end
